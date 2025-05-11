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
        stage('Update Deployment YAML')
        {
            steps{
                script {
                     withCredentials([usernamePassword(credentialsId: 'Git-creds', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_TOKEN')]) {
                    def GITOPS_REPO = "Voting-app-gitops"
                        //def GITOPS_DIR = "gitops-repo"
                        def FILE_PATH = "${GITOPS_REPO}/manifests/deployment.yaml"

                        // Clone GitOps repo into a custom directory
                        sh """
                            rm -rf ${GITOPS_REPO}
                            git clone https://${GIT_USER}:${GIT_TOKEN}@github.com/${GIT_USER}/${GITOPS_REPO}.git ${GITOPS_REPO}
                        """
                    // Replace old tag (e.g., v1.3) with new tag (e.g., v6)
                    sh """
                        sed -i 's|image: .*/voting-app:.*|image: ${IMAGE_NAME}|' ${FILE_PATH}
                        """
                    // Git commit and push
                    sh """
                    cd ${GITOPS_REPO}
                    git config user.name "priyaprince"
                    git config user.email "priyaprince87@gmail.com"
                    git add manifests/deployment.yaml
                    git commit -m "Update image tag to ${IMAGE_VERSION}"
                    git push https://${GIT_TOKEN}@github.com/${GIT_USER}/${GITOPS_REPO}.git HEAD:main
                    """
                }
            }
        }
        }
        
    }
}
