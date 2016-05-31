* 找到本机公网ip
  * ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
