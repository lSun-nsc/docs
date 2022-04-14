#! /bin/bash



#托管更新的md文件
echo "Start to save .md文件"
echo "需切换到main分支"
git checkout main
sleep 1s

if [ ! $2 ]
then
  echo "####### 请输入commit值 #######"
  exit;
fi

echo "开始执行命令"
 
git add .
 
git status
 
#写个sleep 1s 是为了解决并发导致卡壳
 
sleep 1s
 
echo "####### 添加文件 #######"
 
git commit -m "$2"
 
echo "####### commit #######"
 
sleep 1s
 
echo "####### 开始推送 #######"
 
if [ ! $3 ]
then
  echo "####### 请输入自己提交代码的分支 #######"
  exit;
fi
 
git push -u origin "$3"
 
echo "####### 推送成功 #######"



