FROM openjdk:8-jdk-alpine

RUN apk update && apk add --no-cache wget nodejs python3-dev  gcc build-base
RUN pip3 install --upgrade pip pylint setuptools

## Based on this example http://stackoverflow.com/a/40612088/865222
ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    cd /usr/bin && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-SONAR_SCANNER_VERSION && \
    ln -s /usr/bin/sonar-scanner-run.sh /bin/gitlab-sonar-scanner

COPY sonar-scanner-run.sh /usr/bin
