pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build & Push') {  
            steps {   
                script {
                    // 'docker-hub-credentials' wahi ID hai jo aapne Step 1 mein rakhi thi
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        
                        echo 'Building image...'
                        // Image ko apne username ke sath tag karna zaroori hai
                        def myImage = docker.build("pruuuu25/my-test-app:latest")
                        
                        echo 'Pushing image to Docker Hub...'     
                        myImage.push()
                    }
                }
            }
        }
    }
}
