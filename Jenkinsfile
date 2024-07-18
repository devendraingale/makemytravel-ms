pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    tools {
        maven 'Maven'
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
				sh 'podman build -t makemytravel-ms .'
				echo 'Docker build completed succesfully'
			}
		}
		stage ('Docker Image Amazon ECR push'){
			steps {
				scripts{
					withDockerRegistry([credentialsId: 'ecr: us-east-1:ecr-credentials', url: "590184100688.dkr.ecr.us-east-1.amazonaws.com/makemytravel"]){
					sh ''
					echo 'list of docker images Prisent in local'
					docker images
					echo 'Docker tag'
					sh 'docker tag makemytravel-ms:latest 590184100688.dkr.ecr.us-east-1.amazonaws.com/makemytravel-ms'
					echo 'pushing imag'
					sh 'docker push 590184100688.dkr.ecr.us-east-1.amazonaws.com/makemytravel-ms'					
					}
				}
			}
		}

	}
}
