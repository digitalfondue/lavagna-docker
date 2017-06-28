FROM resin/rpi-raspbian

EXPOSE 8080

ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna 
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev
ENV CONTEXT_PATH /

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    echo 'deb http://repos.azulsystems.com/debian stable main' > /etc/apt/sources.list.d/zulu.list && \
    apt-get update -qq && \
    apt-get upgrade && \
    apt-get -qqy install wget unzip ca-certificates zulu-embedded-8 && \ 
    update-alternatives --config java && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN wget "https://github.com/digitalfondue/lavagna/releases/download/lavagna-1.1-M5/lavagna-1.1-M5-distribution.zip" -q -O lavagna.zip && \
    unzip lavagna.zip && \
    rm lavagna.zip && \
    mv lavagna*/ lavagna/

CMD java -Xms64m -Xmx256m -Ddatasource.dialect="${DB_DIALECT}" \ 
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar ./lavagna/lavagna/lavagna-jetty-console.war --headless --contextPath "${CONTEXT_PATH}"
