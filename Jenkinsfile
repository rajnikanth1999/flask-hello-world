pipeline{
    agent any
    stages{
        stage('push'){
            steps{
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 358434574350.dkr.ecr.us-east-1.amazonaws.com
                docker build -t test .
                docker tag test:latest 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker push 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker container run -d -P 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker ps
                '''
            }
        }
        stage('sca'){
            steps{
                dependencyCheck additionalArguments: '--format XML',odcInstallation:'SCA'
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }
        }
}
}