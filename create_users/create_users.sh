#!/bin/bash
info=$PWD/user_lists.txt #username password
username=(`awk '{print $1}' $info`)
password=(`awk '{print $2}' $info`)
count=${#username[@]}

for ((i=0;i<$count;i++))
do
id -u ${username[$i]} >/dev/null 2>&1 
if [ $? -eq 0 ]
then
	echo -e '\E[1;31m'${username[$i]} "has exist"'\E[0m'
else
#	echo ${username[$i]} ${password[$i]}
	useradd -m ${username[$i]} 
	echo ${password[$i]} | passwd --stdin ${username[$i]}
fi
done
echo "the end"
