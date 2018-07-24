#!/bin/bash
flag_countline=false
flag_find=false
flag_all=false
showHelp()
{
    echo "$0 [-h|--help] [-a|--all] [-f|--find filename] [-c|--count  filename] [dir] "
}
showAllFiles() #dir
{   
    local dir="$1"
    if ! test [ -d "$dir" ]; then
	echo "$dir ko phai la duong dan hop le" >/dev/stderr
	exit 1 #(return 1)
    fi
    for d in $dir/* ; do
	echo "$d"
    done
}
findFile() #dir, filename
{
    local dir=$1
    local filename=$s2
    if ! test [ -d "$dir" ]; then
	echo "$dir ko phai la duong dan hop le" >/dev/stderr
	return 1
    fi
    for d in $dir/* ; do
	fname=${d##*/}
	if [ "$fname"="$filename" ]; then
	    echo "$d"
	fi
    done
}
countlines() #file
{
    #phan tren tu lam
    echo "$(wc -l<$file)"
}
showInfos()
{
    if $flag_countline; then
	echo $(countlines)
    fi
    if $flag_find; then
	echo $(findFile)
    fi
    if $flag_all; then
	echo $(showAllFiles)
    fi
}

if [ $# -lt 1 ]; then
    showHelp
    exit 1
fi
while [ $# -ge 1 ]; do
    case $1 in
	-h|--help) showHelp
	    exit 1;;
	-a|--all) flag_all=true
	    shift 
	    ;;
	-f|--find) flag_find=true
	    shift
	    filename1="$1"
	    shift
	    ;;
	-c|--count) flag_countline=true
	    shift
	    ;;
	#lam tiep cai count
    esac
done
showInfos