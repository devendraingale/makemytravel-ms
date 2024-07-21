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
				sh 'docker build -t makemytravel-ms .'
				echo 'Docker build completed succesfully'
			}
		}
		stage ('Login'){
			steps {
				sh '/var/jenkins_home/login.sh'
			}
		}
		stage ('Docker Tag and Docker login & Docker Push'){
			steps {
				sh 'docker tag makemytravel-ms ingaledevendra/makemytravel-ms'
				sh 'docker push ingaledevendra/makemytravel-ms:latest'
			}
		}
		stage ('Docker Image Push to Nexus'){
			steps {
					echo "Push Docker Image to Nexus: In Progress"
					sh 'docker tag makemytravel-ms 10.0.0.18:8085/makemytravel-ms:latest'
					sh 'docker push 10.0.0.18:8085/makemytravel-ms'
					echo "push Docker Image to Nexus: Completed"
				}
				
			}
			stage ('Docker Image Deleted form local machine'){
			steps {
					sh 'docker rmi -f 10.0.0.18:8085/makemytravel-ms ingaledevendra/makemytravel-ms makemytravel-ms'
					echo "push Docker Image Deleted form local machine"
				}
				
			}

	}
}
