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
                sh 'ping 192.168.1.103 \'hostname\''
            }
        }
        stage("Second step") {
            steps {
                sh 'ping 192.168.1.103 \'uptime\''
            }
        }
    }
}
