#! /bin/bash
echo -n "Nhap duong dan :"
read file
if ! test -d  $file;
then
    echo -n "Nhap lai"
    read file
fi

cd $file
echo "Ban co muon xoa toan bo noi dung thu muc va tiep tuc ko?"
read tmp
case "$tmp" in
"y") rm -f
;;
"n") ;;
esac

mkdir BTTL
mkdir BTTH
for (( i=1 ; i<=9 ; i=i+1 )); do
    mkdir BTTL/BTTL$i
    touch BTTL/BTTL$i/1752007.sh
    chmod u+x BTTL/BTTL$i/1752007.sh
done
echo "Thu muc da dc tao"
for (( k=1 ; k<=9 ; k=k+1 )); do
    mkdir BTTH/BTTH$i
    touch BTTH/BTTH$i/1752007.sh
    chmod u+x BTTH/BTTH$i/1752007.sh
done
echo "Thu muc da dc tao"
ls BTTH
ls BTTL
k=1
while [ $k -le 9 ]
do
    for d in BTTL; do
	echo " #! /bin/bash
# ===============================
# Ho va ten : Dinh Nguyen Quoc Bao
# MSSV: 1752007
# Ma bai tap : BTTH03
# =========================================" > BTTL/BTTL$k/1752007.sh
	((k++))
    done
done
k=1
while [ $k -le 9 ]
do
    for d in BTTH; do
	echo " #! /bin/bash
# ==============================
# Ho va ten : Dinh Nguyen Quoc Bao
# MSSV : 1752007k
# Ma bai tap : BTTH03
# ======================================" > BTTH/BTTH$k/1752007.sh
	((k++))
    done
done

cat BTTL/BTTL1/1752007.sh
echo "Thu muc da tao xong"



