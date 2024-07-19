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
		stage ('Docker Image Push to Nexus'){
			steps {
				scipts{
					withCredentials([usernamePassword(credentialsId: 'nexus-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
					sh 'docker login http://10.0.0.18:8085/repository/makemytravel-ms/ -u admin -p ${PASSWORD}' 
					echo "Push Docker Image to Nexus: In Progress"
					sh 'docker tag makemytravel-ms 10.0.0.18:8085/makemytravel-ms:latest'
					sh 'docker push 10.0.0.18:8085/makemytravel-ms'
					echo "push Docker Image to Nexus: Completed"
					}
					
					}
					
				}
				
			}

	}
}
