
# grep

* 统计单次出现个数
  * grep -o "DspError" dsp-tag-failure.log | wc -l
* 统计单次出现的行数
  * grep -c "DspError" dsp-tag-failure.log

# find

* 查找文件名
  * find -name '*xxx*'

* 递归删除
  * find . -name "*.svn" -type d -print -exec rm -rf {} \;

* 查看端口使用情况
  * netstat -an | grep 8000

* 查看进程
  * ps -ef | grep java

# 下载

* curl -O -L http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz && tar xvzf sshpass-1.05.tar.gz
