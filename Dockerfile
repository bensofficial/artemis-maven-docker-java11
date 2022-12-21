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

CMD ["mvn"]
