pipeline {
  agent {
    docker { image 'node:18-alpine' }
  }

  environment {
    DOCKERHUB_USER = 'shivangi0109'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        script {
          GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
        }
      }
    }

    stage('Build Frontend') {
      steps {
        dir('frontend') {
          sh 'npm install'
          sh 'npm run build'
          sh "docker build -t $DOCKERHUB_USER/frontend:$GIT_COMMIT ."
          sh "docker tag $DOCKERHUB_USER/frontend:$GIT_COMMIT $DOCKERHUB_USER/frontend:latest"
        }
      }
    }

    stage('Build Backend') {
      steps {
        dir('backend') {
          sh 'npm install'
          sh "docker build -t $DOCKERHUB_USER/backend:$GIT_COMMIT ."
          sh "docker tag $DOCKERHUB_USER/backend:$GIT_COMMIT $DOCKERHUB_USER/backend:latest"
        }
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'shivangi0109', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh "docker push $DOCKERHUB_USER/frontend:$GIT_COMMIT"
          sh "docker push $DOCKERHUB_USER/frontend:latest"
          sh "docker push $DOCKERHUB_USER/backend:$GIT_COMMIT"
          sh "docker push $DOCKERHUB_USER/backend:latest"
        }
      }
    }
  }
}