all: geomesa-accumulo-distributed-runtime-1.2.4.jar
	docker build -t jamesmcclain/geomesa:0 .

geomesa-dist-1.2.4-bin.tar.gz:
	curl -C - -O 'https://repo.locationtech.org/content/repositories/geomesa-releases/org/locationtech/geomesa/geomesa-dist/1.2.4/geomesa-dist-1.2.4-bin.tar.gz'

geomesa-accumulo-distributed-runtime-1.2.4.jar: geomesa-dist-1.2.4-bin.tar.gz
	tar axvf geomesa-dist-1.2.4-bin.tar.gz
	cp geomesa-1.2.4/dist/accumulo/geomesa-accumulo-distributed-runtime-1.2.4.jar .

clean:
	rm -rf geomesa-1.2.4/

cleaner: clean
	rm -f geomesa-accumulo-distributed-runtime-1.2.4.jar

cleanest: cleaner
	rm -f geomesa-dist-1.2.4-bin.tar.gz
