FROM java:7

RUN wget https://repo1.maven.org/maven2/io/lavagna/lavagna/1.0/lavagna-1.0-distribution.zip
RUN unzip lavagna-1.0-distribution.zip

EXPOSE 8080

CMD java -Ddatasource.driver=org.hsqldb.jdbcDriver -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:file:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profile.active=dev -jar ./lavagna-1.0/lavagna/lavagna-jetty-console.war --headless
