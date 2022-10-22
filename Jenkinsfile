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
                sh 'ssh root@192.168.1.103 /bin/bash <<'EOT'
echo "These commands will be run on: $( uname -a )"
echo "They are executed by: $( whoami )"
EOT'
            }
        }
        stage("Second step") {
            steps {
                sh 'ping -c 4 192.168.1.1'
            }
        }
    }
}
