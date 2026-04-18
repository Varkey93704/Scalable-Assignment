pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'PUSH_TO_DOCKERHUB',
            defaultValue: false,
            description: 'Push Docker image to Docker Hub only for tagged releases'
        )
    }

    environment {
        IMAGE_NAME = 'varkey93704/scalable-assignment'
        LOCAL_IMAGE = 'scalable-assignment:jenkins'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Varkey93704/Scalable-Assignment.git'
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

        stage('Resolve Release Tag') {
            steps {
                script {
                    env.IMAGE_TAG = sh(
                        script: 'git describe --tags --exact-match 2>/dev/null || true',
                        returnStdout: true
                    ).trim()

                    if (env.IMAGE_TAG) {
                        echo "Release tag detected: ${env.IMAGE_TAG}"
                    } else {
                        echo 'No Git tag detected. Docker push stage will be skipped.'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $LOCAL_IMAGE .
                '''
            }
        }

        stage('Run Tests Inside Container') {
            steps {
                sh '''
                docker run --rm $LOCAL_IMAGE pytest
                '''
            }
        }

        stage('Push To Docker Hub') {
            when {
                expression {
                    return params.PUSH_TO_DOCKERHUB && env.IMAGE_TAG?.trim()
                }
            }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_PASS'
                )]) {
                    sh '''
                    echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin

                    docker tag $LOCAL_IMAGE $IMAGE_NAME:$IMAGE_TAG
                    docker tag $LOCAL_IMAGE $IMAGE_NAME:latest

                    docker push $IMAGE_NAME:$IMAGE_TAG
                    docker push $IMAGE_NAME:latest

                    docker logout
                    '''
                }
            }
        }
    }

    post {
        always {
            sh '''
            docker image rm -f $LOCAL_IMAGE || true

            if [ -n "$IMAGE_TAG" ]; then
              docker image rm -f $IMAGE_NAME:$IMAGE_TAG || true
              docker image rm -f $IMAGE_NAME:latest || true
            fi
            '''
        }
    }
}
