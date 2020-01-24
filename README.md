# OpCon on Docker
This repository provides a [docker compose](https://docs.docker.com/compose/) file to bootstrap the process of spinning up working OpCon environments.

To access the full OpCon docker image documentation (Arguments, Environment Variables...):
- [OpCon Image Documentation](doc/docker.md)

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# Prerequisites
- Docker Engine 18.06.0+
- Docker Compose 1.22+ (Compose File Format 3.7)

# Docker-Compose Instructions
Grab the **[docker-compose.yml](docker-compose.yml)** file, define your environment variables via the **.env** file and then run the following command to start MS SQL and OpCon Server containers.
```
docker-compose up
```
Note: *You must be on the same directory as your docker-compose.yml file*

## Environment Variables

### Madantory

```
VOLUME_PATH=c:/opcon-docker //Location of all the container data
DB_PASSWORD= //Opcon DataBase Password
```

### Recommended

```
LICENSE= //The Opcon Key License. Necessary to apply the license (See instructions below - Conversions/OpCon License Key String)
TZ=UTC //The Timezone
```

### Optional

Please see the full Docker Image Documentation about additional environment variables:
- [OpCon Image Documentation](doc/docker.md)

# Alternative Deployments

## Docker Run (Without Docker Compose)

- [OpCon Image Documentation](doc/docker.md)

You can also take a look at the **[docker.sh](docker.sh)** which uses the docker command directly.

## Azure App Service (Doesn't work with the latest Opcon Image)

### How to deploy Opcon App Service on Azure Portal
- [Docker Compose Azure App Service Documentation](doc/docker-compose-azure-app-service.md)

### Docker Compose File for Azure App
- [docker-compose-azure-app-service.yml](docker-compose-azure-app-service.yml)

# Miscellaneous

## OpCon License Key String

How to generate key from file:
- Linux: `cat <LIC_FILE> | hexdump -ve '16/1 "%02x"' | sed 's/.*/<LIC_FILE_WITHOUT_LIC_EXT>:\0/'`
- Windows `certutil -encodehex <LIC_FILE> key.tmp 12 >NUL && echo|set /p="<LIC_FILE_WITHOUT_LIC_EXT>:" || type key.tmp && del key.tmp`

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
