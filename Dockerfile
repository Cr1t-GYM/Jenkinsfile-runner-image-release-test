FROM jenkins-local/jenkinsfile-runner-single

ENV JDK_11 true

ENV JENKINS_UC https://updates.jenkins.io
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/casc
ENV JENKINS_PM_VERSION 2.5.0
ENV JENKINS_PM_URL https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/${JENKINS_PM_VERSION}/jenkins-plugin-manager-${JENKINS_PM_VERSION}.jar

USER root
RUN mkdir -p /app /usr/share/jenkins/ref/plugins /usr/share/jenkins/ref/casc /app/bin \
    && echo "jenkins: {}" >/usr/share/jenkins/ref/casc/jenkins.yaml \
    && wget $JENKINS_PM_URL -O /app/bin/jenkins-plugin-manager.jar

ENTRYPOINT ["/app/bin/jenkinsfile-runner"]