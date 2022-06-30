#!/usr/bin/env bash
set -e

ARTIFACT_ID = jenkinsfile-runner-demo
VERSION = 256.0-test
CWP_VERSION = 1.3
JENKINSFILE_RUNNER_TAG=jenkins-local/jenkinsfile-runner-single

git clone https://github.com/jenkinsci/jenkinsfile-runner
rsync -av --exclude='.git' --exclude='demo' --exclude='tests' --exclude='*/target/*' jenkinsfile-runner source

mkdir -p .build
wget -O .build/cwp-cli-${CWP_VERSION}.jar https://repo.jenkins-ci.org/releases/io/jenkins/tools/custom-war-packager/custom-war-packager-cli/${CWP_VERSION}/custom-war-packager-cli-${CWP_VERSION}-jar-with-dependencies.jar
java -jar .build/cwp-cli-${CWP_VERSION}.jar -configPath packager-config.yml -tmpDir $(shell pwd)/out/tmp -version ${VERSION}

# docker build -t ${JENKINSFILE_RUNNER_TAG} -f $(shell pwd)/out/tmp/output/Dockerfile $(shell pwd)/out/tmp/output/	