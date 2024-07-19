pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    tools {
        maven 'Maven'
    }
	environment {
        // Define Nexus repository URL and credentials ID
        NEXUS_URL = 'login http://10.0.0.18:8085/repository/makemytravel-ms/'
        NEXUS_CREDENTIALS = 'nexus-credentials'
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
					withCredentials([usernamePassword(credentialsId: nexus-credentials, passwordVariable: 'NEXUS_PASSWORD', usernameVariable: 'NEXUS_USERNAME')])
					sh '' 
					curl -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} ${NEXUS_URL}/service/metrics/ping
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
