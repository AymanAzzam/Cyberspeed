pipeline {
    environment {
        registry = "aymanazzam63/app"
        registryCredential = 'dockerhub_user'
        dockerImage = ''
    }
    agent any
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: '1.0', description: 'Image tag like 1.0 or 2.0, ...etc')
    }
    stages {
        stage('Building the image') {
            steps{
                dir('./App/'){
                    script {
                        dockerImage = docker.build(registry + ":${params.IMAGE_TAG}")
                    }
                }
            }
        }
        stage('Deploy the image') {
            steps{
                script {
                        docker.withRegistry('', registryCredential ) {
                            dockerImage.push()
                        }
                }
            }
        }
        stage('Cleaning up') {
            steps{
                powershell "docker rmi $registry:${params.IMAGE_TAG}"
            }
        }
    }
}