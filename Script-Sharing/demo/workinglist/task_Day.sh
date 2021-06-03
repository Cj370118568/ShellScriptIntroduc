#!/bin/sh


#先设置语言为中文
export LANG="zh_CN"
#二
data_today=`date +%a`
#2
week_day=`date +%w`

#判断是否为周日
if [[ $week_day -eq 0 ]]; then
	#statements
	week_day=7
fi

if [[ $week_day -eq 1 ]]; then
	#statements
	`/Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/task_Weekday.sh`
fi

#2018.08.28
data_info=`date +%Y.%m.%d`
#28
data_daka=`date +%d`
data_shenyu=`expr 25 - $data_daka`
#普通文件
# kaitou="今天是"${data_info}。"\n\n每天都有一个好心情，加油！\n\n今天的主要任务是："
#markdown开头
kaitou=">今天是"${data_info}"\n>**记得提交代码！！！**\n>今天打卡了么！"\n>加油！你是最胖的！\n\n##今天的主要任务是：\n\n* [x] \n\n* [ ]"

 
#计算当前周日期 1
to_monday=`expr $week_day - 1`
to_sunday=`expr 7 - $week_day`

monday=`/bin/date -v -${to_monday}d +%d`
sunday=`/bin/date -v +${to_sunday}d +%d`




#计算月份、以周一的月份为准
Month=`/bin/date -v -${to_monday}d +%Y年%m月`
Time=`date`
folder_name=${monday}"-"$sunday
Data_name=`date +%A`

#判断是否是周末
if [[ $week_day -lt 6 ]]; then

	#进入工作目录
	cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/$Month/$folder_name 
	mkdir $Data_name
	echo '今天是'${Data_name}'已经创建了当天的工作目录-'$Data_name'---创建时间是：'$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Day.log
	#进入当天工作目录
	cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/$Month/$folder_name/$Data_name
	#普通文件
	#touch ${data_info}"-工作日志"
	#echo $kaitou >> ${data_info}"-工作日志"

	#markdown
	touch ${data_info}"-工作日志.md"	
	echo $kaitou >> ${data_info}"-工作日志.md"


else
	echo '今天是'${data_info}'。好好休息！~~~~下周继续加班呦'$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Day.log
fi