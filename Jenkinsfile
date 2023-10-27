
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
            git branch: 'main', url: 'https://github.com/Mubarokahh/php-todo.git'
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
  
  }
}
