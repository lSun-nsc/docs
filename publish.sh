#! /bin/bash

#发布最新文件
echo "Start to publish..."
curBranch=git symbolic-ref --short -q HEAD
ghpagesBranch=gh-pages
if [ $curBranch != $ghpagesBranch ]
then 
   echo "需切换到gh-pages分支"
   git checkout gh-pages
fi

echo "开始执行命令"
echo "除了_book之外的文件夹全部清理掉"
git rm --cached -r .
git clean -df
rm -rf *~

echo "复制_book文件夹中的文件到gh-pages分支根目录"

getfilesordir(){
    for file in `ls $1`
    do
        if test -d $file
        then
            echo "file:  $file"
            cp -r $file"/_book/*" $file"/"
        fi
    done
}
 
path="./"
getfilesordir $path

sleep 1s

git add .
 
git status
 
#写个sleep 1s 是为了解决并发导致卡壳
 
sleep 1s
 
echo "####### 添加文件 #######"

if [ ! $2 ]
then
  echo "####### 请输入commit值 #######"
  exit;
fi
 
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



