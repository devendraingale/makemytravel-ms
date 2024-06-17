pipleline{
    options {
        buildDiscarder (logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        }
    agent any
    tools {
        maven 'maven'
    }
    stages{
        stage{
            steps {
				echo 'code is going to compile'
				sh 'mvn clean compile'
			}
        }

    }

}