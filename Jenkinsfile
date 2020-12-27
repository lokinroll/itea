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
                    // docker.withRegistry('', '6fc38c82-5741-4a26-aa5d-e353dfc20ca9') {
                        app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                        // app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    // }
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
            //         docker.withRegistry('registry.hub.docker.com/lokinroll/', '6fc38c82-5741-4a26-aa5d-e353dfc20ca9') {
            //             app.push("/${IMAGE_NAME}:${IMAGE_TAG}")
            //             // app.push("${env.BUILD_ID}-${COMMIT_ID}")                
            //         }
                }
            }
        }
    }

}
