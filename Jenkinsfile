pipeline {
    agent any

    environment {
        // Initialisation de variables globales
        DOCKER_IMAGE_NAME = 'mayssadhahri/reactapp'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout from Git') {
            steps {
                script {
                    // Ajout d'une étape pour la connexion à Git avec des credentials GitHub
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanCheckout']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/MayDh/Reactapp.git', credentialsId: 'github']]])
                }
            }
        }

        stage('Build Image') {
            steps {
                script {
                    // Build d'image
                    sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .'
                }
            }
        }

        

        stage('Push to DockerHub') {
            steps {
                script {
                    // Push vers DockerHub
                    withDockerRegistry(credentialsId: 'dockerhub-credentials', url: 'https://hub.docker.com/u/mayssadhahri') {
                        sh 'docker push $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Nettoyage
                    sh 'docker rmi $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Perform additional actions here if needed.'
        }
        failure {
            echo 'Pipeline failed! Perform cleanup or additional actions here if needed.'
        }
    }
}
