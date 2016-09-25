FROM jamesmcclain/accumulo:7
MAINTAINER James McClain <james.mcclain@gmail.com>

ARG GEOMESA_VERSION
ENV GEOMESA_VERSION ${GEOMESA_VERSION}

ADD geomesa-accumulo-distributed-runtime-${GEOMESA_VERSION}.jar /opt/accumulo-1.7.2/lib/ext/

CMD ["/scripts/leader.sh"]
