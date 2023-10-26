pipeline {
  agent any
  stages {
    stage('Initial cleanup') {
      steps {
        dir(path: "${WORKSPACE}") {
          deleteDir()
        }

      }
    }
cd
    stage('Checkout SCM') {
      steps {
<<<<<<< HEAD
            git branch: 'main', url: 'https://github.com/Mubarokahh/php-todo.git'
=======
        git(branch: 'main', url: 'https://github.com/mubarokahh/php-todo.git')
>>>>>>> 72d5f0c5d85b885af870feee1fe8dc7f38a489bb
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

  }
}
