### 量词

&emsp;&emsp;&emsp;&emsp;下面所有例子，中括号表示被匹配到的内容

* 文件 regular_expression.txt,请注意要换行
  * acbacb
  * ec1
  * ecs
  * eeeeee
  * ed2ed
  * esss
  * esssssss
  * esss123ss
  * 123es312e
* grep 结果
  * 'body're'

* 量词--*
  * 表达式格式
    * body re *
    * 匹配body，re与后面的内容匹配0次或多次，按照最大数量去匹配
  * grep "*" regular_expression.txt
    * 无结果,因为没有指定 re
  * grep "ess*" regular_expression.txt
    * 'es'ss' body:es,re:2
    * 'es'ssssss' body:es,re:6
    * 'es'ss'123ss body:es,re:2
    * 123'es'312e body:es,re:o


* 量词--+
  * 表达式格式
    * body re +
    * 匹配body，re与后面的内容匹配1次或多次，按照最大数量去匹配
  * grep "ess*" regular_expression.txt
    * 'es'ss' body:es,re:2
    * 'es'ssssss' body:es,re:6
    * 'es'ss'123ss body:es,re:2

* 量词--?
  * 表达式格式
    * body re ?
    * 匹配body，re与后面的内容匹配0次或1次，按照最大数量去匹配
  * grep "ess\?" regular_expression.txt
    * 'es's's body:es,re:1
    * 'es's'sssss body:es,re:1
    * 'es's's123ss body:es,re:1
    * 123'es'312e body:es,re:o

* 量词--{n}
  * 表达式格式
    * body re {n}
    * 匹配body，re与后面的内容匹配n次
  * grep "ess\{1,3\}" regular_expression.txt
    * 'es'sss'sss body:es,re:3

* 量词--{n,m}
  * 表达式格式
    * body re {n,m}
    * 匹配body，re与后面的内容匹配最少匹配n次最多匹配m次，按照最大数量去匹配
    * 匹配结果按照最大次数来匹配
  * grep "ess\{1,3\}" regular_expression.txt
    * 'es'ss' body:es,re:2
    * 'es'sss'sss body:es,re:3
    * 'es'ss'123ss body:es,re:2

* 量词--{n,}
  * 表达式格式
    * body re {n,}
    * 匹配body，re与后面的内容匹配最少匹配n次.按照最大数量去匹配
    * 匹配结果按照最大次数来匹配
  * grep "ess\{1,\}" regular_expression.txt
    * 'es'ss' body:es,re:2
    * 'es'ssssss' body:es,re:6
    * 'es'ss'123ss body:es,re:2

* 量词--.
  * 表达式格式
    * body .
    * body后面跟着任意一个字符
    * 未指定，表示匹配所有字符。任意字符可以是body
  * grep "e." regular_expression.txt
    * 'e'c'1
      * c 代表e后面的任意字符
    * 'e'c's
    * 'e'e'e'e'e'e'
      * 这里e是 body 也可以是e后面的任意字符
    * 'e'd'2'e'd'
      * d 是 e 后面的任意字符
    * 'e's'ss
      * s 是 e 后面的任意字符
    * 'e's'ssssss
    * 'e's'ss123ss
    * 123'e's'312e

* 范围--[]
  * 表达式
    * body []
    * body 串后的字符必须在 [] 范围内
    * 未指定body 则是匹配所有，任意字符都可以是body
  * grep "a[a-d]" regular_expression.txt
    * 'a'c'[b]'a'c'b 中间b不是
  * grep "[a-d]" regular_expression.txt
    * acbacb 所有都是
    * e'c'1
    * e'c's
    * e'd'[2e]'d'
