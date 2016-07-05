FROM java:8-alpine

EXPOSE 8080

ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna 
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev

RUN wget "http://repo1.maven.org/maven2/io/lavagna/lavagna/1.0.6.2/lavagna-1.0.6.2-distribution.zip"
RUN unzip lavagna-1.0.6.2-distribution.zip

CMD java -Xms128m -Ddatasource.dialect="${DB_DIALECT}" \ 
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar ./lavagna-1.0.6.2/lavagna/lavagna-jetty-console.war --headless
