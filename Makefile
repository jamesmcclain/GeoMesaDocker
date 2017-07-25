GEOMESA_VERSION := 1.3.2

all: geomesa-accumulo-distributed-runtime-${GEOMESA_VERSION}.jar
	docker build \
		--build-arg GEOMESA_VERSION=${GEOMESA_VERSION} \
		-t jamesmcclain/geomesa:${GEOMESA_VERSION} .

geomesa-accumulo-dist_2.11-${GEOMESA_VERSION}-bin.tar.gz:
	curl -C - -O 'https://repo.locationtech.org/content/repositories/geomesa-releases/org/locationtech/geomesa/geomesa-accumulo-dist_2.11/${GEOMESA_VERSION}/geomesa-accumulo-dist_2.11-${GEOMESA_VERSION}-bin.tar.gz'

geomesa-accumulo-distributed-runtime-${GEOMESA_VERSION}.jar: geomesa-accumulo-dist_2.11-${GEOMESA_VERSION}-bin.tar.gz
	tar axvf geomesa-accumulo-dist_2.11-${GEOMESA_VERSION}-bin.tar.gz
	cp geomesa-accumulo_2.11-${GEOMESA_VERSION}/dist/accumulo/geomesa-accumulo-distributed-runtime_2.11-${GEOMESA_VERSION}.jar .

clean:
	rm -rf geomesa-${GEOMESA_VERSION}/

cleaner: clean
	rm -f geomesa-accumulo-distributed-runtime_2.11-${GEOMESA_VERSION}.jar

cleanest: cleaner
	rm -f geomesa-accumulo-dist_2.11-${GEOMESA_VERSION}-bin.tar.gz
