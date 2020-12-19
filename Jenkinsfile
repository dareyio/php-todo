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
            git branch: 'main', url: 'https://github.com/darey-devops/php-todo.git'
      }
    }


    stage('Establish Pre-requisites') {
      steps {
             sh 'mv .env.sample .env'
      }
    }


    stage('Install Dependencies And Run Unit Tests ') {
      steps {
             sh 'composer install && ./vendor/bin/phpunit'
      }
    }
               
    

// stage ('Starting ART job') {
//     build job: 'ansible-project', parameters: [[$class: 'StringParameterValue', name: 'systemname', value: systemname]]
// }
    
  }
}