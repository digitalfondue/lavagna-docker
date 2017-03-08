FROM openjdk:8-jre-alpine

EXPOSE 8080

ENV DB_HOST "-"
ENV DB_USER "-"
ENV DB_PASS "-"

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

RUN wget "https://github.com/digitalfondue/lavagna/releases/download/lavagna-1.0.7.3/lavagna-1.0.7.3-distribution.zip" -O lavagna.zip && \
    unzip lavagna.zip && \
    rm lavagna.zip && \
    mv lavagna*/ lavagna/

CMD java -Xms64m -Xmx128m -Ddatasource.dialect=MYSQL \ 
-Ddatasource.url=jdbc:mysql://"${DB_HOST}"/lavagna?useSSL=false&createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=UTF-8 \ 
-Ddatasource.username="${DB_USER}" \ 
-Ddatasource.password="${DB_PASS}" \ 
-Dspring.profiles.active=prod \ 
-jar ./lavagna/lavagna/lavagna-jetty-console.war --headless
