pipeline {
  agent any

  stages {

      stage("Initial cleanup") {
          steps {
              dir("${WORKSPACE}") {
              deleteDir()
              }
          }
      }

      stage('Checkout SCM') {
          steps {
              git branch: 'main', url: 'https://github.com/Anefu/php-todo.git'
          }
      }
      
      stage('Build image') {
          steps {
              sh "docker build -t anefu/php-todo:${env.BRANCH_NAME}-${env.BUILD_NUMBER} ."
          }
      }
       stage('Docker Push') {
           when { expression { response.status == 200 } }
           steps {
               withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh "docker push anefu/php-todo:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
               }
           }
        }
    }
}
