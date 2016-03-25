FROM java:8

ENV lvgVersion = 1.0.6.1

RUN wget https://central.maven.org/maven2/io/lavagna/lavagna/${lvgVersion}/lavagna-${lvgVersion}-distribution.zip
RUN unzip lavagna-${lvgVersion}-distribution.zip

EXPOSE 8080

CMD java -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:file:lavagna -Ddatasource.username=sa -Ddatasource.password= -Dspring.profile.active=dev -jar ./lavagna-${lvgVersion}/lavagna/lavagna-jetty-console.war --headless
