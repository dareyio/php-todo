pipeline {
    agent any

    environment {
        PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/home/ec2-user/.config/composer/vendor/bin"
    }

    stages {
        stage('Initial cleanup') {
            steps {
                dir(path: "${WORKSPACE}") {
                    deleteDir()
                }
            }
        }

        stage('Checkout SCM') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/Mubarokahh/php-todo.git'
                }
            }
        }

        stage('Prepare Dependencies') {
            steps {
                sh 'mv .env.sample .env'
                sh 'composer install'
                sh 'php artisan migrate'
                sh 'php artisan db:seed'
                sh 'php artisan key:generate'
            }
        }

        stage('Execute Unit Tests') {
            steps {
                sh './vendor/bin/phpunit'
            }
        }

        stage('Code Analysis') {
            steps {
                sh 'phploc app/ --log-csv build/logs/phploc.csv'
            }
        }

        stage('Plot Code Coverage Report') {
            steps {
                script {
                    plot csvFileName: 'plot-396c4a6b-b573-41e5-85d8-73613b2ffffb.csv', 
                         csvSeries: [[
                             displayTableFlag: true, 
                             exclusionValues: 'Lines of Code (LOC),Comment Lines of Code (CLOC),Non-Comment Lines of Code (NCLOC),Logical Lines of Code (LLOC)', 
                             file: 'build/logs/phploc.csv', 
                             inclusionFlag: 'INCLUDE_BY_STRING', 
                             url: ''
                         ]], 
                         group: 'phploc', 
                         numBuilds: '100', 
                         style: 'line', 
                         title: 'A - Lines of code', 
                         yaxis: 'Lines of Code'
                }
                // Add other plot steps here if needed
            }
        }

        stage('Package Artifact') {
            steps {
                sh 'zip -qr php-todo.zip ${WORKSPACE}/*'
            }
        }

       stage('SonarQube Quality Gate') {
      when { branch pattern: "^develop*|^hotfix*|^release*|^main*", comparator: "REGEXP"}
        environment {
            scannerHome = tool 'SonarQubeScanner'
        }
        steps {
            withSonarQubeEnv('sonarqube') {
                sh "${scannerHome}/bin/sonar-scanner -Dproject.settings=sonar-project.properties -Dsonar.projectKey=php-todo"
            }
            timeout(time: 1, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
            }
        }

        stage('Upload Artifact to Artifactory') {
            steps {
                script {
                    def server = Artifactory.server 'artifactory-server'
                    def uploadSpec = '''{
                        "files": [
                            {
                                "pattern": "php-todo.zip",
                                "target": "wurapbl/php-todo",
                                "props": "type=zip;status=ready"
                            }
                        ]
                    }'''
                    server.upload spec: uploadSpec
                }
            }
        }

        stage('Deploy to Dev Environment') {
            steps {
                build job: 'ansible-config-mgt/main', parameters: [[$class: 'StringParameterValue', name: 'env', value: 'dev']], propagate: false, wait: true
            }
        }
    }
}
} 
