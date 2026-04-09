pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'javac app/App.java'
            }
        }

        stage('SonarQube Scan') {
            steps {
                sh 'sonar-scanner'
            }
        }

        stage('Run App') {
            steps {
                sh 'docker build -t myapp .'
                sh 'docker run -d -p 8080:8080 myapp'
            }
        }

        stage('ZAP Scan') {
            steps {
                sh '''
                docker run --network="host" owasp/zap2docker-stable \
                zap-baseline.py -t http://localhost:8080
                '''
            }
        }
    }
}
