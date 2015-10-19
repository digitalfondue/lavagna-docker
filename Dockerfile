FROM java:7

RUN wget https://repo1.maven.org/maven2/io/lavagna/lavagna/1.0.4.1/lavagna-1.0.4.1-distribution.zip
RUN unzip lavagna-1.0.4.1-distribution.zip

EXPOSE 8080

CMD java -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:file:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profile.active=dev -jar ./lavagna-1.0.4.1/lavagna/lavagna-jetty-console.war --headless
