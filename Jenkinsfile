pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('8d6a9649-883a-4d97-b8bb-e272d569ffb2')  // Jenkins credentials ID for Docker login
	SSH_CREDENTIALS = credentials('	8d889fd7-4288-4988-a9c3-840d7e3c8e43') // Jenkins SSH credentials ID for target hosts
	REMOTE_HOSTS = 'node-01,node-02,node-03' // Comma-separated list of target hostnames/IPs (as a string)
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
		stage('Deploy Docker Container to Multiple Hosts') {
            		steps {
                		script {
                    			// Deploy Docker container to each remote host
                    			sshagent (credentials: [SSH_CREDENTIALS]) {
                        								REMOTE_HOSTS.each { host ->
                           								sh """
                       								     	ssh -o StrictHostKeyChecking=no ${host} 'docker pull ingaledevendra/makemytravel-ms:latest'
                            								ssh -o StrictHostKeyChecking=no ${host} 'docker stop app-01 || true'  // Stop any running container
                            								ssh -o StrictHostKeyChecking=no ${host} 'docker rm app-01 || true'    // Remove the stopped container
                            								ssh -o StrictHostKeyChecking=no ${host} 'docker run -d -p 8080:8080 --name app-01 ingaledevendra/makemytravel-ms:latest'  // Run the new container
                            								"""
                        							   	}
                    								   }
                			}
            			}
        	}

	}
}
