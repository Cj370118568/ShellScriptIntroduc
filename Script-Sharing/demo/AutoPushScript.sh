# !/bin/bash

# 遍历当前文件夹下目录，需要提交的代码，分别提交


filelist=`ls`
commitmsg="添加路由跳转（push、内部跳转、openView），hook配置使用路由api"

for file in $filelist
do
if test -d $file
then
#是文件夹
cd $file

tmpfilelist=`ls -a`

#判断是否包含git,如果包含，直接pull,不包含，需要遍历文件夹
if [[ "${tmpfilelist[@]}" =~ ".git" ]]; then
echo '*******************'$file'是git目录，即将pull,add,commit,push'
git add .
git commit -m $commitmsg
git pull
git push
cd ..
else
echo '*******************'$file'不是git目录，需要遍历'

subfilelist=`ls`

for subfile in $subfilelist
do
if test -d $subfile
then
#是文件夹
cd $subfile
subtmpfilelist=`ls -a`

if [[ "${subtmpfilelist[@]}" =~ ".git" ]]; then
echo '*******************'$subfile'是git目录，即将pull,add,commit,push'
git add .
git commit -m $commitmsg
git pull
git push
cd ..
fi
fi
done
cd ..
fi
else
echo '*******************'$file'不是文件夹'
fi

done








