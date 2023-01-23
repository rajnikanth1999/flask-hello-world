pipeline{
    agent any
    stages{
        stage('push'){
            steps{
                sh '''
                sonar-scanner  -Dsonar.projectKey=flask  -Dsonar.sources=.  -Dsonar.host.url=http://44.203.73.66:9000  -Dsonar.login=sqp_f62552db7aff114d324875e779d47acfa1d8fc91
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