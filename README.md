```bash
docker network create --driver bridge geowave
docker run -it --rm -p 9995:50095 --net=geowave --hostname leader --name leader jamesmcclain/geomesa:0
```
