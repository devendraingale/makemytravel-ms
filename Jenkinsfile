pipeline {
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    tools {
        maven 'maven_3.8'
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
	}
}