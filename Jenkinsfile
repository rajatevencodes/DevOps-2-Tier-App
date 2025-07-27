pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/rajatevencodes/DevOps-2-Tier-App.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t 2-tier-flask-app-img .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'DockerHubCredentials',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_PASSWORD'
                )]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag 2-tier-flask-app-img $DOCKERHUB_USERNAME/2-tier-flask-app-img:latest'
                    sh 'docker push $DOCKERHUB_USERNAME/2-tier-flask-app-img:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d --build flask-app'
            }
        }
    }
        post {
        success {
            script {
                emailext(
                    from:    'rajatcantcode@gmail.com',
                    to:      'rajatcantcode@gmail.com',
                    subject: 'Build success for Demo CICD App',
                    body:    'Build success for Demo CICD App'
                )
            }
        }
        failure {
            script {
                emailext(
                    from:    'rajatcantcode@gmail.com',
                    to:      'rajatcantcode@gmail.com',
                    subject: 'Build Failed for Demo CICD App',
                    body:    'Build Failed for Demo CICD App'
                )
            }
        }
    }
}