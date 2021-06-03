#!/bin/bash
# name="CodeCj"
# echo $name;
# echo "第一个变量：$1";

# current=`ls`
# echo $current

/bin/date >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/time.txt

# read testvar;
# echo $testvar;

# ------------------------------------变量----------------------------------------
# studentName="小明"
# echo "那位调皮的同学叫${studentName}"
# echo "那位调皮的同学叫$studentName"

# ------------------------------------数组----------------------------------------
# nameArr=("football" "足球" "篮球" "羽毛球") #在Shell中，用括号来表示数组，数组元素用"空格"符号分割开。定义数组的一般形式为：数组名=(值1 值2 ... 值n)
# echo ${nameArr[0]} #读取数组元素值的一般格式是：数组名[下标]
# # 取得数组元素的个数
# length=${#nameArr[@]}
# echo $length
# # 或者
# length=${#nameArr[*]}
# echo $length
# # 取得数组单个元素的长度
# length=${#nameArr[n]}
# echo $length

# ------------------------------------传递参数----------------------------------------
# echo "Shell 传递参数实例！";
# echo "执行的文件名：$0";
# echo "第一个参数为：$1";
# echo "第二个参数为：$2";
# echo "第三个参数为：$3";

# # ------------------------------------流程控制if----------------------------------------
# a=10
# b=20
# if [ $a == $b ]
# then
#    echo "a 等于 b"
# elif [ $a -gt $b ]
# then
#    echo "a 大于 b"
# elif [ $a -lt $b ]
# then
#    echo "a 小于 b"
# else
#    echo "没有符合的条件"
# fi

# # ------------------------------------流程控制for----------------------------------------
# for loop in 1 2 3 4 5
# do
#     echo "The value is: $loop"
# done

# # ------------------------------------流程控制while----------------------------------------
# int=1
# while(( $int<=5 ))
# do
#     echo $int
#     let "int++"
# done

# # ------------------------------------流程控制until----------------------------------------
# #!/bin/bash

# a=0

# until [ ! $a -lt 10 ]
# do
#    echo $a
#    a=`expr $a + 1`
# done

# # ------------------------------------流程控制case----------------------------------------
# echo '输入 1 到 4 之间的数字:'
# echo '你输入的数字为:'
# read aNum
# case $aNum in
#     1)  echo '你选择了 1'
#     ;;
#     2)  echo '你选择了 2'
#     ;;
#     3)  echo '你选择了 3'
#     ;;
#     4)  echo '你选择了 4'
#     ;;
#     *)  echo '你没有输入 1 到 4 之间的数字'
#     ;;
# esac

# #!/bin/sh

# site="runoob"

# case "$site" in
#    "runoob") echo "菜鸟教程"
#    ;;
#    "google") echo "Google 搜索"
#    ;;
#    "taobao") echo "淘宝网"
#    ;;
# esac

# # ------------------------------------函数----------------------------------------
# funWithReturn(){
#     echo "这个函数会对输入的两个数字进行相加运算..."
#     echo "输入第一个数字: "
#     read aNum
#     echo "输入第二个数字: "
#     read anotherNum
#     echo "两个数字分别为 $aNum 和 $anotherNum !"
#     return $(($aNum+$anotherNum))
# }
# funWithReturn
# echo "输入的两个数字之和为 $? !"

# funWithParam(){
#     echo "第一个参数为 $1 !"
#     echo "第二个参数为 $2 !"
#     echo "第十个参数为 $10 !"
#     echo "第十个参数为 ${10} !"
#     echo "第十一个参数为 ${11} !"
#     echo "参数总数有 $# 个!"
#     echo "作为一个字符串输出所有参数 $* !"
# }
# funWithParam 1 2 3 4 5 6 7 8 9 34 73