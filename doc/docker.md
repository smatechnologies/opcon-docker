# Docker Run/Create #

## Environment Variables

| Variable                   | Default       | Description                         |
| -------------------------- | ------------- | ----------------------------------- |
| SQL_ADMIN_USER             |               | The user that runs the DB upgrade scripts. |
| SQL_ADMIN_PASSWORD         |               | The DB upgrade script user's password. |
| DB_SERVER_NAME             |               | **Required:** SQL Server instance name. |
| DATABASE_NAME              |               | **Required:** OpCon Database name. |
| SQL_AUTH                   | true          | Specifies if SQL authentication is used or Windows authentication. |
| DB_USER_NAME               |               | **Required:** Database user used by OpCon services. |
| DB_PASSWORD                |               | **Required:** Password of database user used by OpCon services. |
| DB_CONFIGURATION           | None          | Additional configuration. Values allowed AlwaysON, Mirroring or None. |
| DB_SETUP                   | false         | Specifies if database upgrade should be run before starting OpCon services. |
| NO_RUN                     | false         | Specifies if OpCon services should start or not (e.g. upgrade DB without starting services). |
| DB_LOGICAL_DATA_FILENAME   | OpConxps_Data | Database data file name. |
| PATH_TO_DATABASE_DATA_FILE | C:\Program Files\Microsoft SQL<br>Server\MSSQL14.MSSQLSERVER<br>\MSSQL\DATA\OpConxps_Data.MDF | Path to data file. |
| DB_LOGICAL_LOG_FILENAME    | OpConxps_Log  | Database log file name. |
| PATH_TO_DATABASE_LOG_FILE  | C:\Program Files\Microsoft SQL<br>Server\MSSQL14.MSSQLSERVER<br>\MSSQL\DATA\OpConxps_Log.MDF | Path to log file. |
| SMTP_SERVER_NAME           |               | SMTP server name. |
| NOTIFY_EMAIL_ADDRESS       |               | Notify handler email. |
| NOTIFY_DOMAIN_NAME         |               | Notify domain name. |
| CREATE_API_CERTIFICATE     | false         | Specifies if a self signed certificate must be created for the API before startup. |
| API_USES_TLS               | true          | Specifies if API should use TLS. |
| API_CERTIFICATE_PATH       |               | Path where API certificate file (PFX) is located. |
| API_CERTIFICATE_PASSWORD   |               | Password to access certificate (PFX) file. |
| SM_WEB_SSL                 | true          | Specifies if Solution Manager uses TLS. |
| SM_WEB_PORT                | 8181          | Specifies port used by Solution Manager. |
| TZ                         | UTC           | Timezone of the container. |
| LICENSE_KEY                |               | OpCon license key. Applied only on first start. |
| LICENSE_NAME               | 0             | Name of license file without ".lic" extension. |

## Example

See [docker.sh](../docker.sh)