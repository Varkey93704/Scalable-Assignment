pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Varkey93704/Scalable-Assignment.git'
            }
        }

        stage('Setup Environment') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Lint') {
            steps {
                sh '''
                . venv/bin/activate
                flake8 app.py tests --ignore=E402
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                . venv/bin/activate
                pytest
                '''
            }
        }
    }
}