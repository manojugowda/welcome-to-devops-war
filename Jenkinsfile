pipeline {
	agent none
environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
	}
    stages {
	    
       stage('checkout') {
	       agent { label 'slave' }
            steps {
                sh 'sudo rm -rf welcome-to-devops-war'
	sh 'git clone https://github.com/manojugowda/welcome-to-devops-war'	
              }
        }
	 stage('build') {
		 agent { label 'slave' }
            steps {
                dir('welcome-to-devops-war'){
                  sh 'pwd'
                sh 'ls'
            
                sh 'docker build -t tomcat:1.0 .'  
                }
            }
	 }
	 stage('deploy'){
		 agent { label 'slave' }
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 8888:8080 tomcat:1.0'
	     }
	 }
		stage('Login') {
			agent { label 'slave' }
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
	stage('Push') {
		agent { label 'slave' }

			steps {
			    sh 'docker tag tomcat:1.0 manojdevops28/tomcatnew:1.3'
				sh 'docker push manojdevops28/tomcatnew:1.3'
			}
		}
stage('pull image'){
    agent { label 'slave-3' }
        steps{
            sh 'docker rm -f mytomcat'
            sh 'docker run -d --name mytomcat -p 7100:8080 manojdevops28/tomcatnew:1.3'
        }
    }
    }
}
