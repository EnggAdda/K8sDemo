pipeline {
    agent {
        docker {
            image 'openjdk:17'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t k8s-demo .'
            }
        }
        stage('Docker Push') {
            steps {
                withRegistry([url: 'https://registry.hub.docker.com']) {
                    sh 'docker push k8s-demo'
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
