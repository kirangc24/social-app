pipeline {
    agent any

    environment {
        NODEJS_HOME = '/usr/local/nodejs' // Node.js 16.0.0 installed manually
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/kirangc24/social-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh 'nohup npm start &'
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
