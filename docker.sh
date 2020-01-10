#!/bin/sh

DOCKER_PATH=C:/docker
DOCKER_OPCON_IMAGE_VERSION=19.1.1-latest
DOCKER_MSSQL_IMAGE_VERSION=2017-latest

DatabasePassword=
DatabasePasswordEncrypted=
LicenseKey=
#LicenseName=0
#DataBaseName=OpConxps
#Timezone=UTC

echo "* Prepare"
mkdir -p $DOCKER_PATH/opcon/config
mkdir $DOCKER_PATH/opcon/log

docker pull smaengineering.azurecr.io/opcon:$DOCKER_OPCON_IMAGE_VERSION

echo "* Create Network"
docker network create opcon-network

echo "* Create Volume"
docker volume create opcon-data

echo "* Run Mssql Container"
docker run -d --name "opcon-mssql" --hostname "opcon-mssql" --net="opcon-network" --restart=always -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=${DatabasePassword}" -v opcon-data:/var/opt/mssql -p 1433:1433 mcr.microsoft.com/mssql/server:${DOCKER_MSSQL_IMAGE_VERSION}

echo "* Run Opcon Container"
docker run -d --name "opcon-core" --hostname "opcon-core" --net="opcon-network" --restart=always -e "DatabaseName=${DatabaseName:=OpConxps}" -e "OpConxpsDBServerName=opcon-mssql" -e "OpConxpsSQLInstance=opcon-mssql" -e "DBLogicalDataFilename=${DatabaseName:=OpConxps}"_Data -e "DBLogicalLogFilename=${DatabaseName:=OpConxps}_Log" -e "PathToDatabaseDataFile=/var/opt/mssql/data/${DatabaseName:=OpConxps}_Data.MDF" -e "PathToDatabaseLogFile=/var/opt/mssql/data/${DatabaseName:=OpConxps}_Log.LDF" -v ${DOCKER_PATH}/opcon/config:/app/config -v ${DOCKER_PATH}/opcon/log:/app/log -p 9010:9010 -p 8181:8181 smaengineering.azurecr.io/opcon:$DOCKER_OPCON_IMAGE_VERSION -t "${Timezone:=UTC}"-c -d -u "sa" -p "${DatabasePassword}" -P "${DatabasePasswordEncrypted}" -l "${LicenseKey}" -L "${LicenseName:=0}"
