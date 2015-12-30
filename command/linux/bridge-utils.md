* yum search bridge-utils

* yum install bridge-utils

* 添加一个网桥
  * brctl addbr br0
  * ip addr add 192.168.1.20/24 dev br0
  * ip link set dev br0 up
