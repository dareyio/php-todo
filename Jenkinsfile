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


    stage('Install Dependencies') {
      steps {
             sh 'mv .env.sample .env'
             sh 'composer install'
             sh 'php artisan migrate'
             sh 'php artisan db:seed'
             sh 'php artisan key:generate'
      }
    }


    stage('Unit Tests') {
      steps {
             sh './vendor/bin/phpunit'
      }
    }
               
    stage('Reports') {
      steps {
             sh 'phploc app/ --log-csv build/logs/phploc.csv'
      }
    }


    

// stage ('Starting ART job') {
//     build job: 'ansible-project', parameters: [[$class: 'StringParameterValue', name: 'systemname', value: systemname]]
// }
    
  }
}