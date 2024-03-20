pipeline {
    environment {
        registry = "aymanazzam63/app"
        registryCredential = 'dockerhub_user'
        dockerImage = ''
    }
    agent any
    parameters {
        string(name: 'image-tag', defaultValue: '1.0', description: 'Image tag like 1.0 or 2.0, ...etc')
    }
    stages {
        stage('Building our image') {
            steps{
                dir('./App/'){
                    script {
                        dockerImage = docker.build(registry + ":${params.image-tag}")
                    }
                }
            }
        }
        stage('Deploy our image') {
            steps{
                script {
                        docker.withRegistry('https://registry.hub.docker.com', registryCredential ) {
                            dockerImage.push()
                        }
                }
            }
        }
        stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}