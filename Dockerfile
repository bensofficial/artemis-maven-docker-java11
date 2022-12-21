FROM maven:3-eclipse-temurin-11-focal

RUN apt-get update && apt-get install -y \
    gnupg \
 && rm -rf /var/lib/apt/lists/*

ENV M2_HOME /usr/share/maven

RUN echo "$LANG -- $LANGUAGE -- $LC_ALL" \
    && curl --version \
    && gpg --version \
    && git --version \
    && mvn --version \
    && java --version \
    && javac --version


ADD artemis-java-template /opt/artemis-java-template

RUN mvn clean install test -f /opt/artemis-java-template/pom.xml

RUN rm -rf /opt/artemis-java-template

CMD ["mvn"]
