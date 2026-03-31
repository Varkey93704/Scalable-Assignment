pipeline {
    agent any

    environment {
        IMAGE_NAME = 'aceest-fitness-app:jenkins'
    }

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Python') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 --version'
                    } else {
                        bat 'python --version'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    if (isUnix()) {
                        sh '''
                            python3 -m pip install --upgrade pip
                            python3 -m pip install -r requirements.txt
                        '''
                    } else {
                        bat '''
                            python -m pip install --upgrade pip
                            python -m pip install -r requirements.txt
                        '''
                    }
                }
            }
        }

        stage('Lint') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 -m flake8 app.py tests'
                    } else {
                        bat 'python -m flake8 app.py tests'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 -m pytest'
                    } else {
                        bat 'python -m pytest'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t $IMAGE_NAME .'
                    } else {
                        bat 'docker build -t %IMAGE_NAME% .'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build validation passed.'
        }
        failure {
            echo 'Build validation failed.'
        }
    }
}
