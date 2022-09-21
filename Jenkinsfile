def DOCKER_HUB_USER = params.docker_hub_user
def DOCKER_HUB_PASS = params.docker_hub_pass
def VERSION = params.version

pipeline {
  agent any

  stages {
    stage('Fetch') {
      steps {
        git 'https://github.com/alwayslearningPLs/go-hello.git' 
      }
    }

    stage('Build') {
      steps {
        sh "docker image build --tag go-hello:${VERSION} --file ./Dockerfile --no-cache ."
        sh "docker tag go-hello:${VERSION} estenoesmiputonombre/go-hello:${VERSION}"
      }
    }

    stage('Login') {
      steps {
        sh "docker login https://index.docker.io/v1/ -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASS}"
      }
    }

    stage('Push') {
      steps {
        sh "docker image push estenoesmiputonombre/go-hello:${VERSION}"
      }
    }
  }
}
