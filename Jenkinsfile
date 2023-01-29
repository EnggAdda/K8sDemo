pipeline {
    agent any
     tools{
            maven 'MavenTool'
        }
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                bat 'docker build -t k8s-demo .'
            }
        }
        stage('Docker Push') {
            steps {
                    bat 'docker login'
                    bat 'docker push enggadda/k8s-demo'

            }
        }
        stage('Deploy to K8s') {
            steps {
                bat 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
