# macOS脚本入门分享

- [macOS脚本入门分享](#macos脚本入门分享)
  - [案例](#案例)
  - [目的&应用场景](#目的应用场景)
  - [macOS下的脚本](#macos下的脚本)
  - [基本知识](#基本知识)
    - [使用方式](#使用方式)
    - [语法基础](#语法基础)
  - [demo](#demo)
  - [总结](#总结)
  - [附](#附)
    - [参考链接](#参考链接)
    - [实用脚本](#实用脚本)

## 案例

## 目的&应用场景

## macOS下的脚本

## 基本知识

### 使用方式

### 语法基础

- **常用命令**
  - echo
  - test
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

- **函数**

## demo

## 总结

## 附

### 参考链接

- [Shell 编程快速入门](https://www.runoob.com/w3cnote/shell-quick-start.html)
- [Mac下Shell脚本使用](https://www.jianshu.com/p/780cdac4e9a7)

### 实用脚本
