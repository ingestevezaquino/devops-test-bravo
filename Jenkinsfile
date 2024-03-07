pipeline {
  agent any
  environment {
    // Determines which env both apps will be compiled for.
    BUILD_ENV='prod' // CHOOSE FROM: 'dev', 'stg', 'prod'.
    
    APP_NAME_FRONTEND='helloworld'
    APP_NAME_BACKEND='helloworld-api'

    // Adjusts which port is the API URL gonna use.
    API_URL='http://localhost:8081/api'
  }
  stages {

    /////////////////////////////////////////////////////
    // BACK END
    /////////////////////////////////////////////////////
    stage('Clone Git Repo | Backend') {
      steps {
        dir('src/backend') {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']],
          userRemoteConfigs: [[url: 'https://bitbucket.org/bravo-devops-test/helloworld-api.git']]])
        }
      }
    }
    stage('Build App | Backend') {
      steps {
        dir('src/backend') {
          sh 'JAVA_HOME=/usr/lib/jvm/java-17-openjdk mvn clean install'
        }
      }
    }
    stage('Build Docker Image | Backend') {
      steps {
        sh 'docker build -f ./docker/Dockerfile.backend \
          --build-arg BUILD_ENV=$BUILD_ENV \
          -t $APP_NAME_BACKEND:$BUILD_ENV \
          ./src/backend'
      }
    }

    /////////////////////////////////////////////////////
    // FRONT END
    /////////////////////////////////////////////////////
    stage('Clone Git Repo | Frontend') {
      steps {
        dir('src/frontend') {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']],
          userRemoteConfigs: [[url: 'https://bitbucket.org/bravo-devops-test/helloworld.git']]])
        }
      }
    }
    stage('Fetch dependencies | Frontend') {
      steps {
        dir('src/frontend') {
          sh 'npm install'
        }
      }
    }
    stage('Build App | Frontend') {
      steps {
        dir('src/frontend') {
          sh 'echo "VITE_API=$API_URL" > ./.env.$BUILD_ENV'
          sh 'npm run build:$BUILD_ENV'
        }
      }
    }
    stage('Build Docker Image | Frontend') {
      steps {
        sh 'docker build -f ./docker/Dockerfile.frontend \
          --build-arg BUILD_ENV=$BUILD_ENV \
          -t $APP_NAME_FRONTEND:$BUILD_ENV \
          ./src/frontend'
      }
    }

    /////////////////////////////////////////////////////
    // DOCKER COMPOSE
    /////////////////////////////////////////////////////
    stage('Docker Compose Up') {
      steps {
        sh 'docker compose -f ./docker/docker-compose-dev.yml down'
        sh 'docker compose -f ./docker/docker-compose-stg.yml down'
        sh 'docker compose -f ./docker/docker-compose-prod.yml down'

        sh 'docker compose -f ./docker/docker-compose-$BUILD_ENV.yml up -d'
      }
    }

  }
}