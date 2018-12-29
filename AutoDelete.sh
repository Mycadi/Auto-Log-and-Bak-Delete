#!/bin/bash

#循环查出tomcat文件
for i in `ls |grep tomcat`;
do
#输出查出来的tomcat文件
echo $i;
		#判断查出来的每一个tomcat文件夹中是否有backup这个文件夹
        if [ -d "$i/backup" ]; then
		#tomcat文件夹中有backup这个文件夹的执行rm命令删除2017、2018、2019开头的文件
                rm -rf $i/backup/2017*
                rm -rf $i/backup/2018*
                rm -rf $i/backup/2019*
        fi
        #判断查出来的每一个tomcat文件夹中是否有logs这个文件夹
        if [ -d "$i/logs" ]; then
		#tomcat文件夹中有logs这个文件夹的执行find命令查找7天后的文件进行删除。
		find $i/logs/ -mtime +7 -name "*.out.*" -exec rm -rf {} \;
		find $i/logs/ -mtime +7 -name "*.log" -exec rm -rf {} \;
		find $i/logs/ -mtime +7 -name "*.txt" -exec rm -rf {} \;
	fi
done
#提示清理完成
echo "Delete Bak Logs Over..."