#### Gem安装源替换
  gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ -v
  bundle config mirror.https://rubygems.org https://gems.ruby-china.org
#### 产生安全密钥
`**终端运行**`

  rake(rails) secret RAILS_ENV=production

  echo $SECRET_KEY_BASE

If you're on a normal Ubuntu machine just put export SECRET_KEY_BASE=" <<< output from rake secret here >>> " in your `~/.bashrc`.

Run `source ~/.bashrc` and restart the app.
#### Mysql 密码修改
  mysql -u root

  mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');

#### Rails template 引用(github上的code row Url)
  rails app:template LOCATION=https://raw.githubusercontent.com/guxiaobai/oh-my-rails/master/capistrano.rb

#### 使用Homebrew安装docker
`docker--1.12.1.121332.dmg`

   执行 brew --cache
   得到/Users/zgt/Library/Caches/Homebrew
   ll 查看  进入到 /Cask  目录  run open ./  打开当前目录 并将docker.dmg文件拷贝进去
   run brew cask install docker
#### 替换docker安装源
  https://ep1dz7wh.mirror.aliyuncs.com

#### docker基本命令
* docker pull mysql 下载 mysql 镜像
* docker pull ruby 下载 ruby 镜像
* docker pull ubuntu
* docker images 查看下载的镜像
* docker run -it ubuntu 运行ubuntu虚拟机（容器盒子概念）
* docker ps -a 查看虚拟机的运行状态
* exit 退出并关闭虚拟机
* docker exec -it 8f592ce3fcf4 bash 重新进入刚刚关闭的虚拟机
* docker ps -a 再次查看虚拟机的运行状态（发现上一个并未关闭 是Up）
* docker stop 8f592ce3fcf4 关闭刚刚的虚拟机
* docker commit 8f592ce3fcf4 zgt:v1 创建一个名为zgt:v1的镜像
* docker images 可以查看刚刚创建的镜像
* docker run -it zgt:v2 启动虚拟机
* exit 退出并关闭虚拟机  
* docker ps -a 查看虚拟机的运行状态
* docker rm 8f592ce3fcf4 删除虚拟机
* docker run -it -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql bash 空密码进入mysql虚拟机
* docker images 查看下载的镜像
* docker run -it ruby(d8805446e6f5) bash 进入ruby虚拟机
* docker run -it -v /Users/zgt/Documents:/app c08b3de225e9 bash -v 是在虚拟机的根目录下面中指定一个app的文件夹 镜像 ~/Documents
* docker images 查看下载的镜像
* docker rmi ruby mysql 删除镜像
* mkdir docker_demo 并进入
* touch Dockerfile
* vi Dockerfile

```
FROM ruby:2.3
RUN sed -i 's/httpredir.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y mysql-client postgresql-client nodejs sqlite3
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ -v
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
RUN gem install rails -v 5.0.0.1
```
* 当前目录下运行 docker build -t rails:v3 . 新建镜像rails:v3
* docker images 查看下载的镜像
* docker run -it -v ~/Documents:/apple rails:v3 bash
* 进入虚拟机 ll  并进入/apple
* 就会在 实体机的~/Documents 操作
