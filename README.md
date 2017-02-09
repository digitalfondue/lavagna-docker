## Supported tags and respective `Dockerfile` links ##

-	[`latest`](https://github.com/digitalfondue/lavagna-docker/blob/master/Dockerfile)
-	[`stable`](https://github.com/digitalfondue/lavagna-docker/blob/stable/Dockerfile)

## About ##

This repository contains the Dockerfiles used to deploy Lavagna.

## Usage ##

To run the image digitalfondue/lavagna, execute the following command:

```
docker run -d  -p 8080:8080 --name=lavagna --restart=always digitalfondue/lavagna
```

Once that the container is up and running just go to this address to finish the setup:

```
http://[website]:8080/setup
```

## Notes ##

The current version uses HSQLDB with file persistence, it works but it's intended to be used only as a demo.
Set the following ENV variables to override the default behaviour:

    - DB_DIALECT: [HSQLDB / MYSQL / PGSQL]
    - DB_URL: jdbc connection string 
    - DB_USER: db username
    - DB_PASS: db password
    - SPRING_PROFILE [dev / prod]
