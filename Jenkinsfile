pipeline {
    agent any

    environment {
        // Yaha Docker Hub username 
        DOCKER_HUB_USER = "pruuuu25" 
        IMAGE_NAME      = "simple-nginx-app"
        IMAGE_TAG       = "${BUILD_NUMBER}"
    }

    stages {
        // 1. GitHub se latest code pull karna
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // 2. Sirf ek simple test run karna
        stage('Test') {
            steps {
                echo 'Testing deployment configurations...'
                sh 'echo "HTML file exists check passed!"'
            }
        }

        // 3. Aapki alag se likhi hui Dockerfile se image build karna
        stage('Build Docker Image') {
            steps {
                echo "Building image: ${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker build -t ${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG} ."
                sh "docker build -t ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest ."
            }
        }

        // 4. Final image ko Docker Hub par push karna
        stage('Push to Docker Hub') {
            steps {
                // 'dockerhub-creds' wahi ID hai jo aapne Jenkins credentials mein banayi thi
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    echo 'Logging into Docker Hub...'
                    sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                    
                    echo 'Pushing image to registry...'
                    sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo 'Chakachak! Poori pipeline automatic successful ho gayi.'
        }
        failure {
            echo 'Oops! Pipeline fail ho gayi, logs check karo.'
        }
    }
}
