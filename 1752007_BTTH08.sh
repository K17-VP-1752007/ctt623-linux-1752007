#!/bin/bash
flag_help=false
flag_find=false
flag_count=false
flag_add=false
flag_delete=false
showHelp()
{
    echo " [-h|--help] [-f|--find] [-c|--count] [-a|--add] [-d|--delete] danhba.txt"
}
find()
{
    echo " Nhap:"
    read a
    while read line; do
	for word in $line; do
	    if [[ $word == $a ]]; then
		echo $line
		return 1
	    fi
	done
    done <danhba.txt
}
count()
{
    i=0
    echo -n "So muc:"
    while read line; do
	((i=i+1))
    done <danhba.txt
    echo $i
}
add()
{
    echo -n " Nhap lastname:"
    read last
    echo -n "Nhap firstname:"
    read first
    echo -n "Nhap so dien thoai:"
    read num
    echo " Last Name: $last; First Name: $first; Phone: $num" >> danhba.txt
}

delete()
{
    echo "Nhap muc can xoa: "
    read del
    touch new.txt;
    cp danhba.txt new.txt
    dem=0
    while read line; do
	((dem++))
	for word in $line; do
	    if [[ $word == $del ]]; then
		break
	    fi
	done
    done <danhba.txt

    i=0
    while read line ; do
	dem=$((dem-1))
	if ((dem>0)); then
	    ((i++))
	    if ((i==1)); then
		echo $line >danhba.txt
	    else
		echo $line >>danhba.txt
	    fi
	fi
    done <new.txt
    rm new.txt
}

while [ $# -ge 1 ]; do
    case $1 in
	-h|--help) flag_help=true
	    shift
	    ;;
	-f|--find) flag_find=true
	    shift
	    ;;
	-c|--count) flag_count=true
	    shift
	    ;;
	-a|--add) flag_add=true
	    shift
	    ;;
	-d|--delete) flag_delete=true
	    shift
	    ;;
     esac
done

showInfo()
{
    if $flag_help; then
	echo $(showHelp)
    fi
    if $flag_find; then
	find $*
    fi
    if $flag_count; then
	count $*
    fi
    if $flag_add; then
	add $*
    fi
    if $flag_delete; then
	delete $*
    fi
}
input="$2"
readFile()
{
    if test -e $2; then
	showInfo $2
    else
	echo " Ko ton tai"
	exit 1
    fi
}
process()
{
    local input="$2"
    readFile $input
}
process $input

find danhba.txt
count danhba.txt
add danhba.txt
delete danhba.txt