pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    tools {
        maven 'Maven'
    }
	environment {
        AWS_REGION = 'us-east-1' // Specify your AWS region
        ECR_REPOSITORY_NAME = 'makemytravel' // Specify your ECR repository name
        IMAGE_TAG = 'latest' // You can dynamically set this to a version number or build ID
    }
	stages {
		stage ('code Compile'){
			steps {
				echo 'code is going to compile'
				sh 'mvn clean compile'
			}
		}
		stage ('code Test'){
			steps {
				echo 'code is going to tests'
				sh 'mvn clean test'
			}
		}
		stage ('code package'){
			steps {
				echo 'code is going to package'
				sh 'mvn clean package'
			}
		}
		stage ('Docker Build'){
			steps {
				sh 'docker build -t makemytravel-ms .'
				echo 'Docker build completed succesfully'
			}
		}
		stage ('Docker Image Amazon ECR push'){
			steps {
                
				sh "docker push $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY_NAME}:${IMAGE_TAG}"
                
            }
			}
		}

	}
}
