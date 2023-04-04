FROM openjdk:17-alpine
RUN mkdir -p /opt/app/logs
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
RUN echo "Asia/Kolkata"  >  /etc/timezone
RUN apk --no-cache add curl
WORKDIR /opt/app
COPY target/demo-0.0.1-SNAPSHOT.jar /opt/app/
EXPOSE 9090
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar", "--server.port=9090"]
