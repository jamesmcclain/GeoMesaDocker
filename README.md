This image is intended for local development.
If you are interested in using Docker to run GeoMesa on EMR (for development or deployment),
please consider using [GeoDocker](https://github.com/geodocker/geodocker).

# Build #

The image `jamesmcclain/geomesa:1.3.4` can be built by typing:
```bash
make
```

# Start The GeoMesa Container #

Start a GeoMesa-enabled Accumulo container by typing:
```bash
docker network create --driver bridge geomesa
docker run -it --rm -p 50095:50095 --net=geomesa --hostname leader --name leader jamesmcclain/geomesa:1.3.4
```

Optional additional followers can be started by typing:
```bash
docker run -it --rm --net=geomesa --entrypoint /scripts/follower.sh jamesmcclain/geomesa:1.3.4
```

# Testing #

As previously described, start the GeoMesa container like this:
```
docker run -it --rm -p 50095:50095 --net=geomesa --hostname leader --name leader jamesmcclain/geomesa:1.3.4
```
then I start a maven container to build/run the GeoMesa tutorial like this
```
docker run -it --rm --net=geomesa maven:3-jdk-8 bash
```
and inside of that container type this
```
mkdir src
cd src
git clone https://github.com/geomesa/geomesa-tutorials.git
cd geomesa-tutorials
mvn clean install -pl geomesa-quickstart-accumulo
java -cp geomesa-quickstart-accumulo/target/geomesa-quickstart-accumulo-1.3.4.1-SNAPSHOT.jar com.example.geomesa.accumulo.AccumuloQuickStart -instanceId instance -zookeepers leader -user root -password password -tableName tutorial
```
which should produce output which looks something like this
```
Creating feature-type (schema):  AccumuloQuickStart
The version of ZooKeeper being used doesn't support Container nodes. CreateMode.PERSISTENT will be used instead.
Creating new features
Inserting new features
Submitting query
1.  Bierce|322|Tue Jul 15 21:09:42 UTC 2014|POINT (-77.01760098223343 -37.30933767159561)|null
2.  Bierce|925|Mon Aug 18 03:28:33 UTC 2014|POINT (-76.5621106573523 -37.34321201566148)|null
3.  Bierce|589|Sat Jul 05 06:02:15 UTC 2014|POINT (-76.88146600670152 -37.40156607152168)|null
4.  Bierce|886|Tue Jul 22 18:12:36 UTC 2014|POINT (-76.59795732474399 -37.18420917493149)|null
5.  Bierce|931|Fri Jul 04 22:25:38 UTC 2014|POINT (-76.51304097832912 -37.49406125975311)|null
6.  Bierce|394|Fri Aug 01 23:55:05 UTC 2014|POINT (-77.42555615743139 -37.26710898726304)|null
7.  Bierce|343|Wed Aug 06 08:59:22 UTC 2014|POINT (-76.66826220670282 -37.44503877750368)|null
8.  Bierce|259|Thu Aug 28 19:59:30 UTC 2014|POINT (-76.90122194030118 -37.148525741002466)|null
9.  Bierce|640|Sun Sep 14 19:48:25 UTC 2014|POINT (-77.36222958792739 -37.13013846773835)|null
Submitting secondary index query
Feature ID Observation.859 | Who: Bierce
Feature ID Observation.355 | Who: Bierce
Feature ID Observation.940 | Who: Bierce
Feature ID Observation.631 | Who: Bierce
Feature ID Observation.817 | Who: Bierce
Submitting secondary index query with sorting (sorted by 'What' descending)
Feature ID Observation.999 | Who: Addams | What: 999
Feature ID Observation.996 | Who: Addams | What: 996
Feature ID Observation.993 | Who: Addams | What: 993
Feature ID Observation.990 | Who: Addams | What: 990
Feature ID Observation.987 | Who: Addams | What: 987
```

A large volume of dependencies will be downloaded when you run the `mvn` command mentioned above.
If you intend to do this more than once, it is recommended that you volume mount the `.m2` some where so that those dependencies can saved.
