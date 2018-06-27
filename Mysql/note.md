### Mysql 的安装

      mac上面的安装
      brew install mysql
      
      ubuntu上面的安装
      apt-get install mysql-server mysql-client libmysqlclient-dev

      安装过程中出现提示输入root密码可以设置，也可以默认为空

#### 进入mysql并创建数据库
  - mysql -uroot -p

        * 解决mysql 不能在deploy用户下面以root账号登陆的问题：
        sudo su root

        mysql -uroot -p
        use mysql;
        select user,host,plugin from mysql.user;
        update user set plugin="mysql_native_password" where user = 'root';
        flush privileges;
        exit;

        mysql> USE mysql;

  - create database if not exists thrive default charset utf8;
  - show databases;
  - use thrive;
  - show tables;
  - desc <table_name>;

### 创建数据表并指定表的编码格式
    create table if not exists `books` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(45) not null,
    `price` double not null,
    `created_at` datetime not null,
     PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


    create table if not exists `users` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(45) not null,
    `phone` varchar(45) not null,
    `created_at` datetime not null,
     PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

### books表中加入外键
    alter table books add user_id bigint(20);
    alter table books add constraint user_id foreign key(user_id) references users(id);

    alter table <表名> add constraint <外键名> foreign key<字段名> REFERENCES <外表表名><字段名>;

### books表中加入索引
    alter table books add index index_books_on_user_id (name(20));

### insert into
    INSERT INTO `users` VALUES (1,'zgt','13162796586','2018-06-19 01:58:16');

    INSERT INTO `books` VALUES (1,'CSS基础','60.5','2018-06-20 01:58:16',1),(2,'HTML基础','55.0','2018-06-20 01:58:16',1),(3,'JS基础','30.0','2018-06-20 01:58:16',1);

    INSERT INTO `books`(name,price,created_at,user_id) VALUES ('CSS基础','60.5','2018-06-20 01:58:16',1),('HTML基础','55.0','2018-06-20 01:58:16',1),('JS基础','30.0','2018-06-20 01:58:16',1);

### delete
    delete from books where id=1;

### update
    update books set name="xx基础教程" where id=3;

### select 
    select * from books;
    select * from books where id=1;

    select t1.name,t1.price,t2.name,t2.phone from books as t1 left join users as t2 on t1.user_id = t2.id;


### mysqldump 备份数据库

    1.导出数据和表结构 
    mysqldump -uroot -p thrive > thrive.sql
    2.导出数据不导出结构  
    mysqldump -uroot -p -t thrive > thrive_data.sql
    3.导出指定表的数据和表结构
    mysqldump -uroot -p thrive books > books.sql
    4.导出指定表的数据不导出结构
    mysqldump -uroot -p -t thrive books > books_data.sql

### 导入sql文件到数据库
    mysql thrive < thrive.sql


#### Mysql 密码修改
    mysql -uroot -p
    use mysql;
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');
    flush privileges;
    exit;