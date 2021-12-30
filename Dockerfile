FROM openjdk:8-jre-alpine

EXPOSE 8080

ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl fontconfig ttf-dejavu

RUN wget "https://github.com/digitalfondue/lavagna/releases/download/lavagna-1.1.9/lavagna-1.1.9-distribution.zip" -O lavagna.zip && \
    unzip lavagna.zip && \
    rm lavagna.zip && \
    mv lavagna*/ lavagna/

CMD java -Xms64m -Xmx128m -Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar ./lavagna/lavagna/lavagna-jetty-console.war --headless
