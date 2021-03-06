FROM jamesmcclain/accumulo:8u111
MAINTAINER James McClain <james.mcclain@gmail.com>

ARG GEOMESA_VERSION
ENV GEOMESA_VERSION ${GEOMESA_VERSION}

ADD geomesa-accumulo-distributed-runtime_2.11-${GEOMESA_VERSION}.jar /opt/accumulo-1.7.2/lib/ext/

CMD ["/scripts/leader.sh"]
