#!/bin/sh
#获取一周日期date -v +4d +%Y-%m-%d
export LANG="zh_CN"

week_day=`date +%w`
to_monday=`expr $week_day - 1`
to_sunday=`expr 7 - $week_day`

monday=`/bin/date -v -${to_monday}d +%d`
sunday=`/bin/date -v +${to_sunday}d +%d`

Month=`date +%Y年%m月`
Year=`date +%Y年`
Week=`date +%W周`
Time=`date`
folder_name=${monday}"-"$sunday

#工作总结撰写
zhoubaotime_today=`date +%Y.%m.%d`
zhoubaotime_five=`date -d 'friday' +%Y.%m.%d`

zhoubaoname="("${zhoubaotime_today}"~"$zhoubaotime_five")工作周报"
zhoubaomd=$zhoubaoname'.md'
mk_kaitou=">"$zhoubaoname"\n\n>"$Year"共有52周\n本周是第"$Week"\n\n##本周的主要工作为： \n\n* \n\n* \n\n-------\n\n*以下为每天的工作内容*\n\n####周一\n* [ ] \n* [ ]\n\n####周二\n* [ ] \n* [ ] \n\n####周三\n* [ ] \n* [ ]\n\n####周四\n* [ ] \n* [ ]\n\n####周五\n* [ ] \n* [ ]"

# zhoubaoname="("${zhoubaotime_today}"~"$zhoubaotime_five")工作周报"
# kaitou=$zhoubaoname"\n\n"$Year"共有52周，本周是第"$Week"。\n\n本周的主要工作为：\n\n以下为每天的工作内容：\n\n周一：\n\n周二：\n\n周三：\n\n周四：\n\n周五："


cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/ &&
#创建工作日志文档（判断 月份）
if [ ! -d $Month ];then
	`/Users/xxx/Desktop/Code/Shell/Task/task_Month.sh`
#运行完成写入日志
	echo '成功创建了文件夹'$Month >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Month.log
fi

cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/$Month

#本周文档创建
if [[ ! -d $folder_name ]]; then
	mkdir $folder_name
	echo '成功创建了文件夹--'$folder_name '---创建时间是：'$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Weekday.log
	cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/$Month/$folder_name &&
	touch $zhoubaomd  && echo  $mk_kaitou >> $zhoubaomd
	echo '成功创建了周报'$zhoubaomd '---创建时间是：'$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Weekday.log

else
#输出错误日志
	echo $folder_name"文件夹已经存在，创建失败"$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Weekday.log

fi

[xxx@SF-xxx:] ~/Desktop/Code/Shell/Task $ cat task_Month.sh
#!/bin/sh
#获取年月
export LANG="zh_CN"
Month=`date +%Y年%m月`
Time=`date`
cd /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/List/ &&
#创建工作日志文档（判断）
if [ ! -d $Month ];then
mkdir $Month
#运行完成写入日志
echo $Time'成功创建了文件夹'$Month >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Month.log
else
echo $Month"文件夹已经存在，创建失败"$Time >> /Users/chenjian/working/eking/share/ShellScriptIntroduce/Script-Sharing/demo/workinglist/Log/task_Month.log