pipeline {
    agent any

    stages {
        stage('GIT CLONE SCM') {
            steps {
			    echo "CLONING code from Github repo"
               git branch: 'main', url: 'https://github.com/devopstraininghub/mindcircuit14.git'
            }
        }
		
        stage('BUILD ') {
            steps {
                echo "Building code "
				sh 'mvn clean install'
				
            }
        }

        stage('TOMCAT DEPLOY') {
            steps {
                echo "Deploying war file to tomcat"
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://ec2-54-173-89-134.compute-1.amazonaws.com:8091/')], contextPath: 'facebook', war: '**/*.war'
            }
        }		
		
    }
}
