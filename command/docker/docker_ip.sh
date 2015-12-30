# 使用格式：
# docker_addnet.sh 容器名字 IP
# 注意：网桥接口默认为 veth_容器名字
# 注意：网关地址设置为固定的 192.168.1.1

if [ $# != 2 ]; then
    echo -e "ERROR! 使用参数如下: docker_addnet.sh 容器名字 IP"
    exit 1
fi

container_netmask=24
container_gw=192.168.1.1

container_name=$1
bridge_if=veth_`echo ${container_name} | cut -c 1-10`
container_ip=$2/${container_netmask}

container_id=`docker ps | grep $1 | awk '{print \$1}'`


mkdir -p /var/run/netns
ln -s /proc/$pid/ns/net /var/run/netns/$pid

ip link add A type veth peer name B
ip link set A name $bridge_if
brctl addif docker0 $bridge_if
ip link set $bridge_if up
ip link set B netns $pid
ip netns exec $pid ip link set dev B name eth0
ip netns exec $pid ip link set eth0 up
ip netns exec $pid ip addr add $container_ip dev eth0
ip netns exec $pid ip route add default via $container_gw
