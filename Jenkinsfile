pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('8d6a9649-883a-4d97-b8bb-e272d569ffb2')  // Jenkins credentials ID for Docker login
    }
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
				sh 'chmod 777 /var/run/docker.sock'
				sh 'docker build -t makemytravel-ms .'
				echo 'Docker build completed succesfully'
			}
		}
		stage('Docker Login') {
            		steps {
                		script {
                    			// Docker login using stored credentials
                    			sh "echo ${DOCKER_CREDENTIALS_PSW} | docker login -u ${DOCKER_CREDENTIALS_USR} --password-stdin"
                		}
            		}
		}
		stage ('Docker push to docker hub'){
			steps {
				sh 'docker tag makemytravel-ms ingaledevendra/makemytravel-ms:latest'
				sh 'docker push ingaledevendra/makemytravel-ms:latest'
				echo 'Docker build completed succesfully'
			}
		}
		

	}
}
