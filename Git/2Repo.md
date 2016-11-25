#### 合并项目的git操作步骤：

* 修改电脑上gitconfig 配置中的用户名和密码：vim  ~/.gitconfig，用git  log可以查看Author即可。
* 配置2个host地址，一个为公司github项目，另一个是客户github项目，新建config记事本文件，位于~/.ssh/目录下，config内容如下:

  Host github.com
  HostName github.com
  IdentityFile ~/.ssh/zgtqumge
  ForwardAgent no
  Host xnjiang
  HostName github.com
  IdentityFile ~/.ssh/xnjiang
  ForwardAgent no

* zgtqumge和xnjiang分别为公司github的SSH Key和客户github的SSH Key，都要加载
* 添加客户的git远程源
git remote add roc  git@xnjiang:Rocstar99/biinga-dev.git
使用git remote -v 查看结果如下：
origin git@github.com:Qumge/biinga-dev.git (fetch)
origin git@github.com:Qumge/biinga-dev.git (push)
roc git@xnjiang:Rocstar99/biinga-dev.git (fetch)
roc git@xnjiang:Rocstar99/biinga-dev.git (push)
* 确定加载过2个key和remote源添加了之后，执行
（加载提示权限不足的话，执行chmod 0600 zgtqumge zgtqumge.pub）
ssh git@xnjiang
ssh git@github.com
确定是否连通
* 连接客户remote源
git fetch roc，然后运行 git br -a 查看分支， 出现红色 remotes/roc/ui等表示通过
* 从做好的分支剪出新分支，并跟踪(--track)客户远程分支，即本地同步一个
git co -b roc_ui -t roc/ui
通过git log 查看log，跟客户roc源的ui分支commit信息一致
* 在本地roc_ui上，执行git merge UI --squash
* 解决冲突 git co --theirs . （以公司项目这边的UI分支为主，将代码更新）
项目中查找 <<< 没有的话则，解决完毕
* git add.
* git ci -m "提交记录信息"
* git push roc roc_ui:ui
