pipeline{
    agent any
    stages{
        stage('push'){
            steps{
                sh '''
                docker build -t flask .
                docker container run -d -p 5000:5000 flask
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