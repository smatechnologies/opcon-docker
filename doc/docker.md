# Docker Run/Create #

## Parameters

| Parameter       | Requires      | Description                  |
| --------------- | ------------- | ---------------------------- |
| -t \<timezone>  |               | Timezone ("Europe/Paris", "America/Chicago", ...) <br> See https://en.wikipedia.org/wiki/List_of_tz_database_time_zones |
| -c              |               |Generate the certificate      |
| -d              | -u \<dbUser> <br> -p \<dbPwd> <br> var OpConxpsSQLInstance <br> var DatabaseName <br> var PathToDatabaseDataFile (Create only) <br> var  PathToDatabaseLogFile (Create only) <br> var DBLogicalDataFilename (Create only) <br> var DBLogicalLogFilename (Create only) | Create/Update Database |
| -D              | *See -d*      | Force Create/Update Database |
| -u \<dbUser>    |               | Database Username. <br> Necessary to create the "SMAODBCConfiguration.DAT" configuration file* |  
| -p \<dbPwd>     |               | Database Password.           |
| -P \<dbEncrPwd> |               | DataBase Encrypted Password. <br> Necessary to create the "SMAODBCConfiguration.DAT" configuration file* |
| -l \<licKey>    | -L (if not 0) | The Opcon Key License. Necessary to apply the license <br> Applied only the first start after the container creation |
| -L \<licName>   |               | Name of License File Without the ".lic" extension (Automatically set to 0 if not defined) |
| -n              |               | Do not start services        |

\* Requirement to automatically generate the "config/SMAODBCConfiguration.DAT" (if not exists):
 - -u \<dbUser>
 - -P \<dbEncrPwd>  
 - var OpConxpsDBServerName
 - var DatabaseName

## Environment Variables

| Variable               | Default       | Description                         |
| ---------------------- | ------------- | ----------------------------------- |
| DatabaseName           |               | Database Name                       |
| OpConxpsDBServerName   |               | The name of the Database Server     |
| OpConxpsSQLInstance    |               | The Instance of the Database Server |
| DBLogicalDataFilename  | OpConxps_Data | Name of the Database Data File      | 
| DBLogicalLogFilename   | OpConxps_Log  | Name of the Database Log File       |
| PathToDatabaseDataFile |               | Path of the Database Data File <br> i.e.: /var/opt/mssql/data/OpConxps_Data.MDF |
| PathToDatabaseLogFile  |               | Path of the Database Log File <br> i.e.: /var/opt/mssql/data/OpConxps_Log.LDF |
| SmWebSsl               | true          | Enable Solution Manager SSL <br> Applied only the first start after the container creation |
| SmWebPort              | 8181          | Solution Manager Port <br> Applied only the first start after the container creation |

## Example

See [docker.sh](../docker.sh)