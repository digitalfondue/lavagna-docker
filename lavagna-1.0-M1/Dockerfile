FROM java:7

RUN wget https://github.com/digitalfondue/lavagna/releases/download/lavagna-1.0-M1/lavagna-1.0-M1-distribution.tar.gz
RUN tar zxvf lavagna-1.0-M1-distribution.tar.gz

EXPOSE 8080

CMD java -Ddatasource.driver=org.hsqldb.jdbcDriver -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:file:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profile.active=dev -jar ./lavagna-1.0-M1/lavagna/lavagna-jetty-console.war --headless
