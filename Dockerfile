FROM openjdk:11

# Install gradle
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://services.gradle.org/distributions/gradle-6.9.1-bin.zip && \
    unzip gradle-6.9.1-bin.zip && \
    mv gradle-6.9.1 /usr/local/gradle && \
    rm gradle-6.9.1-bin.zip && \
    ln -s /usr/local/gradle/bin/gradle /usr/bin/gradle

COPY . /app
WORKDIR /app
RUN gradle bootJar

ENTRYPOINT ["java", "-jar", "/app/build/libs/test-0.0.1-SNAPSHOT.jar"]