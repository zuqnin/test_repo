#!groovy
// Check ub1 properties
properties([disableConcurrentBuilds()])

pipeline {
    agent { 
        label 'master'
        }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("First step") {
            steps {
                echo "==================== start building image ===================="
                dir ('docker/toolbox') {
                sh 'docker-compose up'
                }
            }
        }
        stage("Second step") {
            steps {
                sh 'ping -c 4 192.168.1.1'
            }
        }
    }
}
