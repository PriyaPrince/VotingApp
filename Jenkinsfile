pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'priyaprince'
        DOCKERHUB_PASS = credentials('dockerhub-credentials-id') // from Jenkins Credentials
        IMAGE_NAME = "${DOCKERHUB_USER}/voting-app"
    }

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/PriyaPrince/VotingApp.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                    docker rm -f voting-app || true
                    docker run -d -p 9090:8080 --name voting-app $IMAGE_NAME
                '''
            }
        }
    }
}
