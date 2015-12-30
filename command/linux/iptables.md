&emsp;&emsp;iptables是linux系统自带的防火墙，功能强大，学习起来需要一段时间，下面是一些习iptables的时候的记录。如果iptables不熟悉的话可以用apf，是一款基于iptables的防火墙，挺好用的。

&emsp;&emsp;centos7 使用 firewalld 替代了

* 启动iptables
  * /etc/init.d/iptables start

* 增删改
  * 当我们用iptables添加规则，保存后，这些规则以文件的形势存在磁盘上的
  * 文件地址是/etc/sysconfig/iptables，我们可以通过命令的方式去添加，修改，删除规则，
  * 也可以直接修改/etc/sysconfig/iptables这个文件就行了。

* 开放端口号3036
  * 开放/usr/sbin/iptables -I INPUT -p tcp --dport 3036 -j ACCEPT
  * 保存/etc/rc.d/init.d/iptables save
  * 查看/etc/init.d/iptables status
