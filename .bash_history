sudo su
docker pull mysql/mysql-server:latest
docker image ls
docker rm mysql-server
docker network create --subnet=172.18.0.0/24 tooling_app_network
export MYSQL_PW=adminPassword
echo $MYSQL_PW
docker run --network tooling_app_network -h mysqlserverhost --name=mysql-server -e MYSQL_ROOT_PASSWORD=$MYSQL_PW  -d mysql/mysql-server:latest
docker ps -a
touch create_user.sql
vi create_user.sql
docker exec -i mysql-server mysql -uroot -p$MYSQL_PW < ./create_user.sql
docker run --network tooling_app_network --name mysql-client -it --rm mysql mysql -h mysqlserverhost -u  -p 
git clone https://github.com/darey-devops/tooling.git
export tooling_db_schema=./tooling/html/tooling_db_schema.sql 
docker exec -i mysql-server mysql -u root -p $MYSQL_PW < $tooling_db_schema
echo $tooling_db_schema
ls
cd tooling/
cd html/
ls
cd ../..
docker exec -i mysql-server mysql -uroot -p$MYSQL_PW < $tooling_db_schema
vi tooling/html/.env
vi create_user.sql 
vi tooling/html/.env
cd tooling/
ls
cd ..
docker run --network tooling_app_network --name mysql-client -it --rm mysql mysql -h mysqlserverhost -u user -p
cd tooling/
ls
docker build -t tooling:0.0.1 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.1
curl localhost:8085
ls
cd tooling
ls
cat apache-cofig.conf
cat apache-config.conf
cat default.conf
cd tooling/
ls
cd html
ls
docker ps -a
docker start mysql-server 
docker ps -a
cd tooling/
ls
cd start-apache
cat start-apache
cat Dockerfile
vi apache-config.conf
docker build -t tooling:0.0.2
cd ..
docker ps -a
docker start mysql-server 
docker start tooling:0.0.1
docker start b6c0de3123ce
docker ps -a
cd tooling/
docker build -t tooling:0.0.2
docker rm b6c0de3123ce
docker stop b6c0de3123ce
docker rm b6c0de3123ce
docker build -t tooling:0.0.1
docker ps -a
Docker build -t tooling:0.0.1
docker build -t tooling:0.0.1
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.1
docker s -a
docker ps -a
docker stop b5992c93df45
docker start b5992c93df45
docker stop b5992c93df45
docker rm b5992c93df45
docker ps -a
ls
cd tooling/
ls
docker build -t tooling:0.0.1 
docker build --help
docker ps -a
docker rm tooling
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.2
docker build -t tooling:0.0.2 . 
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.2
curl localhost:8085
cd tooling/
ls
cd ..
ls
which db_conn.php
tree
cat default.conf
cd tooling/
cat default.conf
cd ..
export tooling_db_schema=/tooling_db_schema.sql
echo $tooling_db_schema
docker ps -a
cd tooling/
cd html/
ls
vi db_conn.php
cd ..
docker build -t tooling:0.0.2 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.2
docker ps -a
docker stop ffc18f48d15d
docker stop 6f52b1b6f242
docker rm 6f52b1b6f242
docker rm ffc18f48d15d
docker ps -a
docker build -t tooling:0.0.3 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.3
cur localhost:8085
curl localhost:8085
cd tooling/
cd html/
ls
cd ../..
sudo vi tooling/html/.env
cd tooling/
cd html/
ls
vi db_conn.php 
cd ../..
docker ps -a
cd tooling/
docker build -t tooling:0.0.3 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.3
docker ps -a
docker stop 8cc12709a916
docker rm 8cc12709a916
docker ps -a
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.3
docker stop 95ee28f17a37
docker rm 95ee28f17a37
docker build -t tooling:0.0.4 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.4
curl localhost:8085
cd tooling/
cd html/
ls
vi db_conn.php 
cd ../..
ls
vi create_user.sql 
cd tooling/
cd html/
vi db_conn.php 
docker ps -a
docker stop 1ffcfbc6fbe2
docker rm 1ffcfbc6fbe2
cd ..
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.4
docker stop 30416036d32a
docker rm 30416036d32a
docker ps -a
docker stop 3c5f1c06414a
docker rm 3c5f1c06414a
docker ps -a
docker build -t tooling:0.0.5 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.5
curl localhost:8085
vi /tooling/html/db_conn.php
cd tooling/
cd html/
ls
vi db_conn.php
cd ..
docker ps -a
docker stop 0748a4aae93b
docker rm 0748a4aae93b
docker ps -a
docker build -t tooling:0.0.6 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.6
curl localhost:8080
curl localhost:8085
docker ps -a
docker stop f24dc85af821
docker rm f24dc85af821
docker ps -a
cd tooling/
cd html/
vi db_conn.php 
cd ..
docker ps -a
docker build -t tooling:0.0.7 .
docker run --network tooling_app_network -p 8085:80 -it tooling:0.0.7
docker ps -a
curl localhost:8085
cd tooling/
ls
cat start-apache
cat Dockerfile 
ls
cat apache-config.conf 
docker pause 150b00cb7a9c
docker exec 150b00cb7a9c ls
docker start 150b00cb7a9c
docker unpause 150b00cb7a9c
docker exec 150b00cb7a9c ls
composer install
sudo apt install composer
Php artisan migrate
Php artisan key:generate
php artisan migrate
php artisan key:generate
curl localhost:8085
cd tooling/
ls
cat apache-config.conf 
docker ps -a
docker start 150b00cb7a9c
docker start eebb42da664a
docker ps -a
git clone https://github.com/darey-devops/php-todo.git
ls
cd php
cd php-todo
ls
touch Dockerfile
vi Dockerfile 
ls
vi Dockerfile 
touch serve.sh
vi serve.sh
curl localhost:8000
docker build -t php:0.0.1 .
docker run --network tooling_app_network -p 8000:80 -it php:0.0.1
docker run --network tooling_app_network -it php:0.0.1
vi serve.sh
docker run --network tooling_app_network -p 8000:80 -it php:0.0.1
docker ps -a
docker stop 891a1166be82
docker stop bba040e742a3
docker stop 0f4f8006faf9
docker rm 891a1166be82
docker rm bba040e742a3
docker rm 0f4f8006faf9
docker ps -a
docker build -t php:0.0.2 .
ls
vi Dockerfile 
rm serve.sh
ls
touch .env.sample
vi .env.sample 
touch .env
vi .env
ls
vi .env
vi artisan 
vi start-apache.sh
ls
vi tooling.yaml
ls
vi README.md 
vi .env
vi .env.sample
docker ps -a
docker build -t tooling:0.0.3 .
docker build -t php:0.0.3 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.3
curl localhost:8000
docker ps -a
docker exec 26172b660c9b ls
docker exec 26172b660c9b 
cd php-todo/
ls
cd app
ls
cat User.php 
cd ..
cd config/
ls
cat database.php 
cd php-todo/
ls
docker ps -a
docker stop a55e50d244d9
docker rm a55e50d244d9
docker start 150b00cb7a9c
docker start eebb42da664a
docker ps -a
docker build -t php:0.0.5 .
docker run --network tooling_app_network -p 8000:8000 -it tooling:0.0.5
docker ps -a
docker stop 1627fc71ba7c
docker rm 1627fc71ba7c
docker build -t php:0.0.6 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.6
cd tooling/
cd ..
cd php-todo/
ls
vi .env
vi .env.sample
vi start-apache.sh 
vi tooling.yaml 
docker ps -a
docker stop 26172b660c9b
docker rm 26172b660c9b
docker ps -a
docker build -t php:0.0.4 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.4
cd php-todo/
cat .env
vi .env
docker ps -a
docker stop 496b0831d457 
docker rm 496b0831d457 
docker build -t php:0.0.7 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.7
vi /var/www/html/vendor/laravel/framework/src/Illuminate/Database/Connectors/Connector.php
docker ps -a
docker rm php:
docker rm php:0.0.7
docker rm php:0.0.7trusting_snyder
docker rm trusting_snyder
docker ps -a
docker start 150b00cb7a9c  
docker start eebb42da664a
docker ps -a
cd php-todo/
vi .env
docker build -t php:0.0.8 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.8
docker ps -a
docker stop ff1d0b630ed2
docker rm ff1d0b630ed2
docker ps -a
docker stop b6731552fd23
docker rm b6731552fd23
cd php-todo/
docker build -t php:0.0.9 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.9
docker build -t php:0.0.10 .
docker run --network tooling_app_network -p 8000:8000 -it php:0.0.10
