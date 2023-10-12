pipeline {
    agent any
    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Choose the action to perform')
    }
    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', credentialsId: '16f3c5ca-384f-48ea-9c25-b30ca6eed9e9', url: 'https://github.com/pankaj0129/terraform-infra-apache.git'
            }
        }
        stage('terraform migrate') {
            when {
                expression { params.action == "apply" || params.action == "destroy" }
            }
            steps {
                dir('apache') {
                    sh 'terraform init -migrate-state'
                }
            }
        }
        stage('terraform init') {
            when {
                expression { params.action == "apply" || params.action == "destroy" }
            }
            steps {
                dir('apache') {
                    sh 'terraform init'
                }
            }
        }
        
        stage('terraform plan') {
            when {
                expression { params.action == "apply" || params.action == "destroy" }
            }
            steps {
                dir('apache') {
                    sh 'terraform plan'
                }
            }
        }
        
        stage('terraform $action') {
            when {
                expression { params.action == "apply" || params.action == "destroy" }
            }
            input {
                message "Do you want to perform ${params.action}?"
                ok "Yes"
            }
            steps {
                dir('apache') {
                    sh "terraform ${params.action} --auto-approve"
                }
            }
        }
    }
}
