&emsp;&emsp; 防火墙


* 图形配置界面 firewall-config
* 命令行客户端 firewall-cmd  
  * 使用firewall-cmd  命令行工具 firewall-cmd 支持全部防火墙特性。

* 获取 firewalld 状态  
  * firewall-cmd --state 此举返回 firewalld 的状态，没有任何输出。
  * 可以使用以下方式获得状态输出： firewall-cmd --state && echo "Running" || echo "Not running"
* 开启防火墙
  * systemctl start firewalld.service
  * 有些系统版本使用 service start firewalld
* 开机启动防火
  * systemctl enable firewalld.service
* 重启防火墙
  * firewall-cmd --reload
* 获取支持区域列表
  * firewall-cmd --get-zones
* 获取所有支持的服务  
  * firewall-cmd --get-services
* 列出全部启用的区域的特性  
  * firewall-cmd --list-all-zones  
  * 输出格式是：  
    * <zone>    
      * interfaces: <interface1> ..   
      * services: <service1> ..   
      * ports: <port1> ..    
      * forward-ports: <forward port1> ..   
      * icmp-blocks: <icmp type1> ....
* 开放端口5001
  * firewall-cmd --zone=public --add-port=5001/tcp --permanent
  * --zone #作用域
  * --add-port=80/tcp  #添加端口，格式为：端口/通讯协议
  * --permanent   #永久生效，没有此参数重启后失效
  * 重启 firewall-cmd --reload
* 查询是否开放端口
  * firewall-cmd --query-port=5001/tcp
