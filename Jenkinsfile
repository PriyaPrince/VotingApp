pipeline {
    agent any
    
    stages {
        stage('Git clone') { 
            steps {
                git branch: 'main', url: 'https://github.com/PriyaPrince/VotingApp.git'
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to tomcat') { 
            steps {
                sh 'echo "i am Deploying the war"'
                sh 'sudo cp "/var/lib/jenkins/workspace/pipeline job01/target/VotingApp-1.0-SNAPSHOT.war" /home/ubuntu/apache-tomcat-10.1.39/webapps/'
            }
        }
    }
}
