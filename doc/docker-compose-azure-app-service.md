# Azure Portal App Service Creation #

From https://portal.azure.com:

- Create a "Resource Group". **Will contain all your resources**
  - Name: The name you want
  - Registration: Development
  - Region: France Central
- Create an "Plan App Service". **Will contain all you docker containers**
  - Name: The name you want
  - Choose your Resource Group
  - Operating System: Linux
  - Location: France Central
  - After creation, you can change the plan: For information, Opcon take ~20 min to start with a B3 Plan)
- Create "Account Storage" **Allows to persist container data**
  - Name: The name you want
  - Location: France Central
  - Type: Blob Storage
  - Mirroring: Local Redundant
- Create an App Service **It's your Container**
  - Name: The name you want
  - Choose your Resource Group
  - Deploy: Container
  - Operating System: Linux
  - Region: France Central
  - Choose your "Plan App Service"

# Azure Docker-Compose Specificities #

- Environment variables are passed to containers but are only interpreted in "environment" value of the docker-compose file
- If one container stops, the deployment will fails
- At least on container must have a service in 80 or 8080 port
  ```
  ports:
    - "80:80"
  ```
  Be careful, the example below seems to not work:
  ```
  ports:
    - "80:90"
  ```
- Only one port published
- The default start time limit is 2 minutes

# Azure Configuration #

- To change the start time limit, add a configuration property:
  `WEBSITES_CONTAINER_START_TIME_LIMIT=1800`
- Persistent Storage volumes:
  1. Named Volume
     ```
     services:
       mycontainer:
         [...]
         volumes:
           - volumename:/mnt
     volumes:
       volumename:
  2. Container Storage
    - Enable storage in configuration properties in your App Service:
      `WEBSITES_ENABLE_APP_SERVICE_STORAGE=true`
    - Define your volume:
      ```
      volumes:
        ${WEBAPP_STORAGE_HOME}/foldername:/mnt
      ```
  3. Account Storage
    - In Account Storage/BLOB Service/Container, add a container
      - Name: The name you want
      - Access: Private
    - In your App Service/Parameters/Configuration, Path Mapping, Create a storage azure mount
      - Name: The name you want (It's the name you will use in your docker-compose file)
      - Choose the Account Storage
      - Choose the Storage Container you previously created
      - Choose a mount path (Not used)
    - Define your volume:
      ```
      volumes:
        storageazuremount/foldername:/mnt
      ```
- Enable Logs
  - In your App Service/Supervision/Log Service, choose File System
  - Set 30 days
  - Set login/password in Deploy/login informations
