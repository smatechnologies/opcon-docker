# OpCon on Docker
This repository provides the necessary to get started with OpCon running on docker.

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# Prerequisites
Docker Engine 18.06.0+ installed since our Docker Compose file format is v3.7.

# Instructions
Grab the docker-compose.yml file, define your environment variable via the .env file and then run the following command to start MS SQL and OpCon Server containers.
```
docker-compose up
```

## Environment Variables

### Madantory

```
VOLUME_PATH=C:/opcon //Location of all the container data
DATABASE_PASSWORD= //Opcon DataBase Password
DATABASE_PASSWORD_ENCRYPTED= //Opcon DataBase Encrypted Password
LICENSE_KEY= //The Opcon Key License (See instructions below)
```

### Optional (default values)

```
CONTAINER_PREFIX=opcon
DATABASE_NAME=OpConxps
DATABASE_USER=sa //This Docker Compose doesn't create specific user for now
LICENSE_NAME=0 //Without the ".lic" extension
VERSION_MSSQL=2017-latest
VERSION_OPCON=19.1.0.10243
PORT_API=9010
PORT_SM=8181
```

## OpCon License Key String

To generate key from file (Linux):
`cat <LIC_FILE> | hexdump -ve '16/1 "%02x"'`

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
