pipeline {
    agent any
    environment {
        COMMIT_ID="""${sh(returnStdout: true, script: 'git rev-parse --short HEAD')}"""
        app = ''
    }
    stages {
        stage('Build') {
            steps {
                script {
                    app = docker.build("lokinroll/${IMAGE_NAME}:${IMAGE_TAG}")

                }
            }
        }
        
        stage('Test') {
            steps {
                sh 'dgoss run -p 80:80 -d -e "NAME=James" -e "AGE=28" ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
        
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/c/', '6fc38c82-5741-4a26-aa5d-e353dfc20ca9') {
                        // app.push("${IMAGE_NAME}:${IMAGE_TAG}")
                        app.push("latest")
                        // app.push("${env.BUILD_ID}-${COMMIT_ID}")                
                    }
                }
            }
        }
    
    }

}
