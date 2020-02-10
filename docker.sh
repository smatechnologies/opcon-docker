#!/bin/sh

DB_PASSWORD=
LICENSE=
VOLUME_PATH=C:/docker/opcon
TZ=UTC
DOCKER_OPCON_IMAGE_REPOSITORY=smatechnologies/opcon-server
DOCKER_OPCON_IMAGE_VERSION=19.1.1-prerelease
DOCKER_MSSQL_IMAGE_VERSION=2017-latest

echo "* Prepare"
mkdir -p ${VOLUME_PATH}/config ${VOLUME_PATH}/log

echo "* Create Network"
docker network create opcon-network

echo "* Create Volume"
docker volume create opcon-data

echo "* Run Mssql Container"
docker run -d --name "opcon-mssql" --hostname "opcon-mssql" --net="opcon-network" -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=${DB_PASSWORD}" -v opcon-data:/var/opt/mssql -p 1433:1433 mcr.microsoft.com/mssql/server:${DOCKER_MSSQL_IMAGE_VERSION}

echo "* Run Opcon Container"
docker run -d --name "opcon-core" --hostname "opcon-core" --net="opcon-network" -e "CREATE_API_CERTIFICATE=true" -e "TZ=${TZ}" -e "LICENSE=${LICENSE}" -e "DB_SETUP=true" -e "SQL_ADMIN_USER=sa" -e "SQL_ADMIN_PASSWORD=${DB_PASSWORD}" -e "DB_USER_NAME=sa" -e "DB_PASSWORD=${DB_PASSWORD}" -e "DB_SERVER_NAME=opcon-mssql"\ -e "DATABASE_NAME=OpConxps" -e "PATH_TO_DATABASE_DATA_FILE=/var/opt/mssql/data/OpConxps_Data.MDF" -e "PATH_TO_DATABASE_LOG_FILE=/var/opt/mssql/data/OpConxps_Log.LDF" -v ${VOLUME_PATH}/config:/app/config -v ${VOLUME_PATH}/log:/app/log -p 9010:9010 -p 8181:8181 ${DOCKER_OPCON_IMAGE_REPOSITORY}:${DOCKER_OPCON_IMAGE_VERSION}
