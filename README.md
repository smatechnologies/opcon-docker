# OpCon on Docker
This repository provides a [docker compose](https://docs.docker.com/compose/) file to bootstrap the process of spinning up working OpCon environments.

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# Prerequisites
Docker Engine 18.06.0+ installed since our Docker Compose file format is v3.7.

# Instructions
Grab the **docker-compose.yml** file, define your environment variables via the **.env** file and then run the following command to start MS SQL and OpCon Server containers.
```
docker-compose up
```
Note: *You must be on the same directory as your docker-compose.yml file*

## Environment Variables

### Madantory

```
VolumePath=C:/opcon-docker //Location of all the container data
DatabasePassword= //Opcon DataBase Password
```

### Recommended

```
DatabasePasswordEncrypted= //Opcon DataBase Encrypted Password. Necessary to create the "SMAODBCConfiguration.DAT" configuration file (See instructions below)
LicenseKey= //The Opcon Key License (See instructions below). Necessary to apply the license
```

### Optional (default values)

```
ContainerPrefix=opcon
DatabaseName=OpConxps
DatabaseUser=sa //This Docker Compose doesn't create specific user for now
LicenseName=0 //Without the ".lic" extension
MssqlVersion=2017-latest
OpconVersion=19.1.0-latest
ApiPort=9010 //Exposed Api Port; The Internal Container port (Localhost) stay 9010
SmWebSsl=true
SmWebPort=8181
MssqlPort=1433
```

## Encrypted Database Password

How to encrypte a password:
- Open Enterprise Manager application
- Menu EnterpriseManager/Password Update/Password Encryption Tool

## OpCon License Key String

How to generate key from file:
- Linux: `cat <LIC_FILE> | hexdump -ve '16/1 "%02x"'`
- Windows `certutil -encodehex <LIC_FILE> licensestring.txt 12`

## Without Docker Compose

- Open docker.sh
- Set the following Environment Variables: DOCKER_PATH, DatabasePassword, DatabasePasswordEncrypted and LicenseKey (Optional: DOCKER_OPCON_IMAGE_VERSION, DOCKER_MSSQL_IMAGE_VERSION, DataBaseName and LicenseName)
- Run the docker.sh script

## Azure App Service

Docker Compose: [docker-compose-azure-app-service.yml](docker-compose-azure-app-service.yml)

 How to deploy Opcon App Service on Azure Portal: [Docker Compose Azure App Service Documentation](doc/docker-compose-azure-app-service.md)

# License
Copyright 2019 SMA Technologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Contributing
We love contributions, please read our [Contribution Guide](CONTRIBUTING.md) to get started!

# Code of Conduct
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code-of-conduct.md)
SMA Technologies has adopted the [Contributor Covenant](CODE_OF_CONDUCT.md) as its Code of Conduct, and we expect project participants to adhere to it. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.
