pipeline {
	agent any

	options {
		timeout(time: 1, unit: 'HOURS')
	}

	environment {
		AWS_DEFAULT_REGION = "eu-west-1"
	}
	stages {
		stage('[PROD] Get credentials') {
			steps {
				script {
					AWS_CREDENTIALS_ID = "AKIA5B76OXH4P2MTX7M2"
					account = 'prod'
				}
			}
		}
		stage("[PROD] deploy parameter") {
			steps {
				withCredentials([
					[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "$AWS_CREDENTIALS_ID"]
				]) {
					sh "make plan"
}
			}
		}
	}
}