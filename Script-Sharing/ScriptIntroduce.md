# macOS脚本入门分享

- [macOS脚本入门分享](#macos脚本入门分享)
  - [案例](#案例)
  - [目的&应用场景](#目的应用场景)
  - [macOS下的脚本](#macos下的脚本)
  - [Shell脚本基本知识](#shell脚本基本知识)
    - [使用方式](#使用方式)
    - [语法基础](#语法基础)
  - [AppleScript](#applescript)
  - [定时启用](#定时启用)
  - [demo](#demo)
  - [总结](#总结)
  - [参考链接](#参考链接)

## 案例

翼课学生组件化之后模块有14个，用命令行的方式来操作非常麻烦，用图形化工具可以稍微减少复杂度。但是效果也很糟糕：
![截屏2021-05-27 17.40.28](/assets/截屏2021-05-27%2017.40.28.png)

这种情况下的最优解就是合理利用脚本减少重复性工作
![QQ20210603-130842@2x](/assets/QQ20210603-130842@2x.png)

## 目的&应用场景

运用脚本的目的就是避免人工去做机械性、重复性的操作，提高工作和生活的效率。

## macOS下的脚本

脚本语言有很多种，你可能听说过的 Shell Script、Python 和 JavaScript，都是其中的代表。
AppleScript 则是 macOS 下提供的系统级别的脚本语言。
今天主要讲的是shell脚本。

## Shell脚本基本知识

### 使用方式

1. 作为可执行程序
   在终端中直接执行脚本文件。 cd 到相应目录

   ```shell
   chmod +x ./test.sh
   ./test.sh #执行脚本
   ```

2. 作为解释器参数
   这种运行方式是，直接运行解释器，其参数就是 shell 脚本的文件名，如：

   ```shell
   /bin/sh test.sh
   /bin/php test.php
   ```

### 语法基础

- **常用命令**
  - echo
  - unix命令
    - cd,ls,cp,rm,mv
    - grep
    - cat
    - read
    - ...
- **变量**
- **数组**
- **传参**
- **运算符**
- **流程控制**
  <details>
  <summary><strong>if</strong></summary>
    <h4>语法</h4>

    ```
    if condition1
    then
        command1
    elif condition2 
    then 
        command2
    else
        commandN
    fi
    ```

    <h4>实例</h4>

    ```
    a=10
    b=20
    if [ $a == $b ]
    then
      echo "a 等于 b"
    elif [ $a -gt $b ]
    then
      echo "a 大于 b"
    elif [ $a -lt $b ]
    then
      echo "a 小于 b"
    else
      echo "没有符合的条件"
    fi
    ```

  </details>
  <details>
  <summary><strong>for</strong></summary>
    <h4>语法：</h4>

     ```for var in item1 item2 ... itemN; do command1; command2… done;```

    <h4>实例：</h4>

    ```
    for loop in 1 2 3 4 5
    do
        echo "The value is: $loop"
    done
    ```

  </details>

  <details>
  <summary><strong>while</strong></summary>
    <h4>语法：</h4>

     ```
    while condition
    do
        command
    done
     ```

    <h4>实例：</h4>

    ```
    int=1
    while(( $int<=5 ))
    do
        echo $int
        let "int++"
    done
    ```

    ```
    //无限循环
    while :
    do
        command
    done

    //无限循环2
    while true
    do
        command
    done
    ```

  </details>

  <details>
  <summary><strong>until</strong></summary>
    <p>
    until 循环执行一系列命令直至条件为 true 时停止。

    until 循环与 while 循环在处理方式上刚好相反。

    一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。
    </p>
    <h4>语法：</h4>

    ```
    until condition
    do
        command
    done
    ```

    <h4>实例：</h4>

    ```
    for loop in 1 2 3 4 5
    do
        echo "The value is: $loop"
    done
    ```

  </details>

  <details>
  <summary><strong>case ... esac</strong></summary>
  <p>
  case ... esac 为多选择语句，与其他语言中的 switch ... case 语句类似，是一种多分枝选择结构，每个 case 分支用右圆括号开始，用两个分号 ;; 表示 break，即执行结束，跳出整个 case ... esac 语句，esac（就是 case 反过来）作为结束标记。

  可以用 case 语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。
  取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。
  </p>
    <h4>语法：</h4>

    ```
    case 值 in
    模式1)
        command1
        command2
        ...
        commandN
        ;;
    模式2）
        command1
        command2
        ...
        commandN
        ;;
    esac
    ```

    <h4>实例：</h4>

    ```
    for loop in 1 2 3 4 5
    do
        echo "The value is: $loop"
    done
    ```

  </details>
  <strong>break</strong>

  <strong>continue</strong>
- **函数**
  - 语法：

    ```
    [ function ] funname [()]

    {

        action;

        [return int;]

    }
    ```

  - 实例：

    ```
    funWithReturn(){ //不带参数
      echo "这个函数会对输入的两个数字进行相加运算..."
      echo "输入第一个数字: "
      read aNum
      echo "输入第二个数字: "
      read anotherNum
      echo "两个数字分别为 $aNum 和 $anotherNum !"
      return $(($aNum+$anotherNum))
    }
    funWithReturn
    echo "输入的两个数字之和为 $? !"
    ```

    ```
    funWithParam(){ //带参数
        echo "第一个参数为 $1 !"
        echo "第二个参数为 $2 !"
        echo "第十个参数为 $10 !"
        echo "第十个参数为 ${10} !"
        echo "第十一个参数为 ${11} !"
        echo "参数总数有 $# 个!"
        echo "作为一个字符串输出所有参数 $* !"
    }
    funWithParam 1 2 3 4 5 6 7 8 9 34 73
    ```

  - 说明
    - \$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用\${n}来获取参数。
    - 还有几个特殊字符用来处理参数：
  
      |参数处理 |说明|
      |:----    |:---|
      |$# |传递到脚本或函数的参数个数|
      |$* | 以一个单字符串显示所有向脚本传递的参数|
      |$$ | 脚本运行的当前进程ID号|
      |$! | 后台运行的最后一个进程的ID号|
      |\$@ | 与$*相同，但是使用时加引号，并在引号中返回每个参数。|
      |$- | 显示Shell使用的当前选项，与set命令功能相同。|
      |$? | 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。|

## AppleScript

## 定时启用

- crontab(linux,Unix常用)
  1. 列出crontab文件```crontab -l```
  2. 新建crontab文件
    **语法**
    ```分 时 日 月 星期 要运行的命令```
     - 第1列分钟0～59
     - 第2列小时0～23（0表示子夜）
     - 第3列日1～31
     - 第4列月1～12
     - 第5列星期0～7（0和7表示星期天）
     - 第6列要运行的命令
  3. 提交crontab文件```crontab xxx```
  4. 编辑crontab文件```crontab -e```
  5. 删除crontab文件```crontab -r```
- launchctl(现在貌似用不了了)
  launchctl 通过配置文件指定执行周期和任务，不同于 crontab，launchctl 的最小时间间隔是 1s。
  - plist 文件存放路径为```/Library/LaunchAgents```或```/Library/LaunchDaemons```，前者仅当用户登陆后才被执行，后者只要系统启动就会被执行。
    **常用key**
    - StartInterval: 指定脚本每间隔多长时间（单位：秒）执行一次；
    - StartCalendarInterval: 可以指定脚本在多少分钟、小时、天、星期几、月时间上执行，类似如crontab的中的设置，包含下面的 key:
      - Minute
      - Hour
      - Day
      - Weekday
      - Month
    - RunAtLoad: 加载时执行一次
    - StandardOutPath: 标准输出路径
    - StandardErrorPath: 错误输出路径
  - 加载任务```launchctl load```
  - 卸载任务```launchctl unload```
  - 立即执行一次任务```launchctl start```
  - 停止任务```launchctl stop```

## demo

- Shell:显示/不显示隐藏文件
- crontab:输出时间
- ~~launchctl:工作日志~~

## 总结

appleScript，shellscript两种脚本语言都可以写出实用的脚本，配合定时执行，可以达到解决重复性工作的效果。

## 参考链接

- [Shell 编程快速入门](https://www.runoob.com/w3cnote/shell-quick-start.html)
- [Mac下Shell脚本使用](https://www.jianshu.com/p/780cdac4e9a7)
- [不错的教程](https://www.jb51.net/article/28514.htm)
- [定时任务](https://www.jianshu.com/p/4addd9b455f2)
