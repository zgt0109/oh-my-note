###  	Ruby 基础
> 知识要点

- rbenv的安装(ruby的版本管理器)
- ruby的安装
- gem(ruby的包管理器)和bundle的介绍和使用
- irb的使用
- ruby-china 社区


> 修改安装源

```shell
备份默认安装源
sudo mv /etc/apt/sources.list{,.default}

使用国内镜像作为安装源
sudo tee /etc/apt/sources.list << EOD
deb http://cn.archive.ubuntu.com/ubuntu/ xenial main multiverse restricted universe
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-backports main multiverse restricted universe
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-proposed main multiverse restricted universe
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-security main multiverse restricted universe
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-updates main multiverse restricted universe
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial main multiverse restricted universe
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-backports main multiverse restricted universe
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-proposed main multiverse restricted universe
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-security main multiverse restricted universe
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-updates main multiverse restricted universe
EOD
```
更新安装源

apt-get update
		

> 安装ubuntu系统的一些编译依赖

[参考地址](https://github.com/rbenv/ruby-build/wiki) 
```                   
apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev language-pack-zh-hans
```

> Rbenv 安装

``` shell
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# 用来编译安装 ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# 用来管理 gemset, 可选, 因为有 bundler 也没什么必要
git clone git://github.com/jamis/rbenv-gemset.git  ~/.rbenv/plugins/rbenv-gemset
# 通过 rbenv update 命令来更新 rbenv 以及所有插件, 推荐
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
# 使用 Ruby China 的镜像安装 Ruby, 国内用户推荐
git clone git://github.com/AndorChen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror

然后把下面的代码放到Unubtu系统的 ~/.bashrc 里

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source ~/.bashrc （使之生效，不然得重新开一个终端）
```

> Ruby 安装

```
rbenv install --list         # 列出所有 ruby 版本
rbenv install 2.5.1 -v

rbenv versions               # 列出安装的版本
rbenv global 2.5.1
rbenv rehash                 # 每次切换ruby版本 要执行
rbenv version                # 列出正在使用的版本

ruby -v                      # 查看ruby版本
```

> gem/bundle的概念

- Gem是封装起来的Ruby应用程序或代码库。

`gem install bundler`

- Gemfile 定义你的应用依赖哪些第三方包，bundle根据该配置去寻找这些包。
- bundle install 相等于多个RubyGems批处理运行。


> irb的使用

	终端中输入irb，进入 交互式 Ruby（IRb）

> ruby-china 社区
	
	https://ruby-china.org/

#### ruby文档

- [官方文档](https://ruby-doc.org/)
- [ruby语法教程](http://www.runoob.com/ruby/ruby-tutorial.html)
- [ruby官方介绍](http://www.ruby-lang.org/zh_cn/libraries/)