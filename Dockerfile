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

# Add wait-for-mysql.sh script
ADD wait-for-mysql.sh /app/wait-for-mysql.sh
RUN chmod +x /app/wait-for-mysql.sh

# Use wait-for-mysql.sh as entrypoint
ENTRYPOINT ["/app/wait-for-mysql.sh", "db:3306", "java", "-jar", "/app/build/libs/test-0.0.1-SNAPSHOT.jar"]
