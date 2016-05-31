# 基本原理

&emsp;&emsp;&emsp;&emsp;Java RMI （Remote Method Invocation 远程方法调用），提供java分布式应用的能力。可以看做是java的RPC。
RMI目前使用Java远程消息交换协议JRMP（Java Remote Messaging Protocol）进行通信。但由于JRMP是专为Java对象制定的，因此，RMI对于用非Java语言开发的应用系统的支持不足，这一点，不同于webservice，http
service

# 运行机制

&emsp;&emsp;&emsp;&emsp;java RMI 包含两个部分：服务端，客户端。服务端创建多个远程对象，客户端通过调用远程对象来获取服务端的业务处理能力。

&emsp;&emsp;&emsp;&emsp;客户端与服务端通信的标准机制是：stub和skeleton。内部核心原理说穿了就是socket调用，所以，在RMI分布式应用系统中，
服务器与客户机之间传递的Java对象必须是可序列化的对象。

&emsp;&emsp;&emsp;&emsp;实现了服务器和客户机的程序后，就是编译和运行该RMI系统。其步骤有：
 * 使用javac编译远程接口类，远程接口实现类和客户机程序。
 * 使用rmic编译器生成实现类的stub和skeleton。
 * 启动RMI注册服务程序rmiregistry。
 * 启动服务器端程序。
 * 启动客户机程序。
