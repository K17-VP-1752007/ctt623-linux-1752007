#!/bin/bash
FLAG_DISPLAY=false
FLAG_SUM=false
FLAG_PRODUCT=false
showHelp()
{
    echo " $0 [-a|--all] [-d|--display] [-s|--sum] [-p|--product] input_file output_file "
}
lengthList()
{
    echo " So luong so nguyen dau vao la: $# "
}
displayList()
{
    $(lengthList $*)
     for d in $*;do
	echo $d
     done
}
sumInt()
{
    sum=0
    for d in $*;do
	sum=$((sum+d))
    done
    echo $sum
}
productInt()
{
    exp=1
    for i in $*;do
	exp=$((exp*i))
    done
    echo $exp
}
showInfos()
{
    if $FLAG_DISPLAY; then
	echo $(displayList)
    fi
    if $FLAG_SUM; then
	echo $(sumInt)
    fi
    if $FLAG_PRODUCT; then
	echo $(productInt)
    fi
}
process()
{
    local input="$1"
    local output="$2"
    if readFile $input; then
	while read line; do
	    displayList $line >$output
	done< $input
    fi
}
readFile()
{
    local dir=$1
    if ! [ -f $dir ]; then
	echo " $dir ko hop le" > /dev/stderr
	exit 1
    fi
}
if [ $# -lt 2 ]; then
     showHelp
     exit 1
fi
while [ $# -gt 2 ]; do
     case $1 in
	 -h|--help) showHelp
	     exit 1;;
	 -d|--display) FLAG_DISPLAY=true
	     shift;;
	 -s|--sum) FLAG_SUM=true
	     shift;;
	 -p|--product) FLAG_PRODUCT=true
	     shift;;
	 -a|--all) FLAG_DISPLAY=true
	     FLAG_SUM=true
	     FLAG_PRODUCT=true
	     shift;;
     esac
done
showInfos
input="$1"
output="$2"
process $input $output
lengthList 1 2 3 4 5
echo "------------------"
displayList 1 2 3 3 3 4
echo "------------------"
sumInt 6 6 6
productInt 4 4 4