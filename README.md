This image is intended for local development.
If you are interested in using Docker to run GeoMesa on EMR (for development or deployment),
please consider using [GeoDocker](https://github.com/geodocker/geodocker).

# Build #

The image `jamesmcclain/geomesa:1.3.1` can be built by typing:
```bash
make
```

# Start The GeoMesa Container #

Start a GeoMesa-enabled Accumulo container by typing:
```bash
docker network create --driver bridge geomesa
docker run -it --rm -p 50095:50095 --net=geomesa --hostname leader --name leader jamesmcclain/geomesa:1.3.1
```

Optional additional followers can be started by typing:
```bash
docker run -it --rm --net=geomesa --entrypoint /scripts/follower.sh jamesmcclain/geomesa:1.3.1
```
