FROM ubuntu:bionic

ARG QGIS_SOURCE=qgis.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install dirmngr ca-certificates && apt-get clean all
RUN apt-key adv --fetch-keys http://qgis.org/downloads/qgis-2016.gpg.key
RUN apt-key adv --fetch-keys http://qgis.org/downloads/qgis-2017.gpg.key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 314DF160
COPY ${QGIS_SOURCE} /etc/apt/sources.list.d/
RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get -y --allow-unauthenticated install \
		qgis \
		python-qgis \
		qgis-plugin-grass && \
	apt-get clean all

ENTRYPOINT ["qgis"]
