pipeline {
  agent {
    docker { image 'node:18-alpine' }
  }

  environment {
    DOCKERHUB_USER = 'your-dockerhub-username'
  }

  stages {
    stage('Build Frontend') {
      steps {
        dir('frontend') {
          sh 'npm install'
          sh 'npm run build'
          sh 'docker build -t $DOCKERHUB_USER/frontend:latest .'
        }
      }
    }

    stage('Build Backend') {
      steps {
        dir('backend') {
          sh 'npm install'
          sh 'docker build -t $DOCKERHUB_USER/backend:latest .'
        }
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push $DOCKERHUB_USER/frontend:latest'
          sh 'docker push $DOCKERHUB_USER/backend:latest'
        }
      }
    }
  }
}
