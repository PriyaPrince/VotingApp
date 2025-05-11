pipeline {
    agent any

    environment {
        DOCKERHUB_USER = "priyaprince"
        IMAGE_VERSION = "v1.${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USER}/voting-app:${IMAGE_VERSION}"
        
             }

    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/PriyaPrince/VotingApp.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

       stage('SonarQube Analysis') {
    steps {
        withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
            withSonarQubeEnv('MySonarQubeServer') {
                sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
            }
        }
    }
}
        stage('Wait for Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Trivy Image Scan')
        {
            steps{
                  sh "trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE_NAME"
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-token', 
                                                  usernameVariable: 'DOCKERHUB_USER', 
                                                  passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh 'echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
        post {
        success {
            emailext(
                subject: "✅ SUCCESS: Job '${JOB_NAME} [#${BUILD_NUMBER}]'",
                body: """Hi Team,

The Jenkins pipeline job *${JOB_NAME}* completed successfully.
Build URL: ${BUILD_URL}

Regards,  
Jenkins
""",
                to: 'priyaaprnzz@gmail.com'
            )
        }

        failure {
            emailext(
                subject: "❌ FAILURE: Job '${JOB_NAME} [#${BUILD_NUMBER}]'",
                body: """Hi Team,

The Jenkins pipeline job *${JOB_NAME}* has failed.
Check the logs at: ${BUILD_URL}

Regards,  
Jenkins
""",
                to: 'priyaaprnzz@gmail.com'
            )
        }
    }
        
    }
}
