#!/bin/bash
# 自己用的一个脚本
#echo "$#"
if (( $# != 2 )); then
	echo -e "erro argument size!\nuse ${0} reponame partdir" >&2;
	exit 1
fi
reponame=$1
partdir=$2
git init $reponame && cd $reponame #新建仓库并进入文件夹
git config core.sparsecheckout true #设置允许克隆子目录
echo "$partdir"  >> .git/info/sparse-checkout #设置要克隆的仓库的相对根目录路径   //空格别漏
git remote add origin git@github.com:lwmfjc/${reponame}.git  # 这里换成你要克隆的项目和库
git pull origin main    #下载代码
git branch --set-upstream-to=origin/main main
