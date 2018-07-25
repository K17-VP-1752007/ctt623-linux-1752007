#!/bin/bash
getLengthList()
{
    echo "So luong so nguyen co trong tham so: $#"
}
displayList()
{
    echo $(getLengthList $*)
    for d in $*;do
	echo $d
    done
}
getEvenNumbers()
{
    echo "So chan:"
    for d in $*;do
	if ((d%2 == 0)); then
	    echo $d
	fi
    done
}
getOddNumbers()
{
    echo " So le :"
    for d in $*;do
	if ((d%2 == 1)); then
	    echo $d
	fi
    done
}
getMax()
{
    max=$1
    for d in $*; do
	if ((max<d)); then
	    max=$d
	fi
    done
    echo "Max: $max"
}
getMin()
{
    min=$1
    for d in $*; do
	if ((min>d)); then
	    min=$d
	fi
    done
    echo "Min: $min"
}
getValueAt()
{
    vitri=$1
    dem=1
    for d in $*; do
	if ((dem == vitri)); then
	    echo "gia tri cua vi tri thu $vitri: $d"
	    return 1
	fi
	((dem=dem+1))
    done
}

input="$1"
output="$2"
showInfos()
{
    displayList $*
    getEvenNumbers $*
    getOddNumbers $*
    getMin $*
    getMax $*
    getValueAt $*
}
readFile()
{
  if test -e $1; then
      exec 3>|"$2"
      while read line; do
	  showInfos $line >&3
      done<"$1"
      exec 3>&-
  else
      echo "file k ton tai"
      exit 1
  fi
}
process()
{
    local input="$1"
    local output="$2"
    readFile $input $output
}
process $input $output

getLengthList 1 2 3 4
displayList 1 2 2
getEvenNumbers 3 4 6
getOddNumbers 1 6 2
getMax 1 9 3
getMin 6 7 4
getValueAt 4  1 2 5 7 6
