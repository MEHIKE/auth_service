FROM openjdk:8-jre-alpine
#FROM java:8
ENV APP_FILE auth-service-0.0.1-SNAPSHOT.jar
ENV APP_HOME /usr/apps
EXPOSE 8085
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
#ENTRYPOINT ["sh", "-c"]
#CMD ["exec java -Xms16m -Xmx32m -XX:MaxMetaspaceSize=48m -XX:CompressedClassSpaceSize=8m -Xss256k -Xmn8m -XX:InitialCodeCacheSize=4m -XX:ReservedCodeCacheSize=8m -XX:MaxDirectMemorySize=16m -jar $APP_FILE"]
ENV JAVA_OPTS "-Xms32m -Xmx64m -XX:MaxMetaspaceSize=96m -XX:CompressedClassSpaceSize=16m -Xss512k -Xmn16m -XX:InitialCodeCacheSize=8m -XX:ReservedCodeCacheSize=16m -XX:MaxDirectMemorySize=32m"
ENTRYPOINT exec java $JAVA_OPTS -jar $APP_FILE
