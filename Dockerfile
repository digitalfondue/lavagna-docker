FROM java:8

RUN wget https://repo1.maven.org/maven2/io/lavagna/lavagna/1.0.6.2/lavagna-1.0.6.2-distribution.zip
RUN unzip lavagna-1.0.6.2-distribution.zip

EXPOSE 8080

CMD java -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:file:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profile.active=dev -jar ./lavagna-1.0.6.2/lavagna/lavagna-jetty-console.war --headless