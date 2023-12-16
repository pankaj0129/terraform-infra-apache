pipeline {
    agent any
    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Choose the action to perform')
    }
    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', credentialsId: '56d0c60f-a014-4fa5-a481-acba50061e7b', url: 'https://github.com/pankaj0129/terraform-infra-apache.git'
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
