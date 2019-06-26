FROM adoptopenjdk:11-jre-hotspot

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JHIPSTER_SLEEP=0
    TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# add directly the war
ADD target/*.jar /app.jar

VOLUME /tmp
EXPOSE 8080 5701/udp
CMD echo "The application will start in ${JHIPSTER_SLEEP}s...." && \
    sleep ${JHIPSTER_SLEEP} && \
    java -Djava.security.egd=file:/dev/./urandom -jar /app.jar