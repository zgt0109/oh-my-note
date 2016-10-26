#### 解决Ubuntu下执行rails db:create 报no role
* sudo su - postgres `切换到系统postgres用户，前提是pg数据库已经安装`
* psql `登录pg控制台`
* create user zgt with password '123456';
* \du `查看角色权限列表`
* alter role zgt with login createdb;
* create user 和 create role 唯一区别是前者默认带有login 属性
* 上述命令也可以一句话：
* create user/role zgt with password '123456' createdb createrole;