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
                    app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")

                }
            }
        }
        
        stage('Test-Right') {
            steps {
                sh 'dgoss run -p 80:80 -d -e "NAME=Alex" -e "AGE=28" ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', '${DOCKER_CREDS}') {
                        app.push("${IMAGE_TAG}")
                        app.push("latest")
                    }
                }
            }
        }

          
    
    }

        post {
         always { 
             emailext attachLog: true, body: 'test', replyTo: 'lokinroll@gmail.com', subject: 'Jenkins job', to: 'lokinroll@gmail.com'
            }
        }
}
