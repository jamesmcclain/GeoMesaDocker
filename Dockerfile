FROM jamesmcclain/accumulo:7
MAINTAINER James McClain <james.mcclain@gmail.com>

ADD geomesa-accumulo-distributed-runtime-1.2.4.jar /opt/accumulo-1.7.2/lib/ext/

CMD ["/scripts/leader.sh"]
