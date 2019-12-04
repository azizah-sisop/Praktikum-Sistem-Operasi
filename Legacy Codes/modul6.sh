#!/bin/bash

 clear
 tes=y
 while [ $tes == ‘y’ ] 
do 
echo “==program data array==” 
echo “1. Demo program array”
echo “2. lihat data array” 
echo “3. penjumlahan data array”
echo “4. exit” 
echo “pilihan : “ 
read pil 

case $pil in 
1)
 echo “masukan banyak element array :”
read input 
for ((i==0;i<$input;i++))
do 
printf “indeks array -$i ; ” 
read array[i] 
done

terbesar_prtm=0 
for((i=0;i<$input;i++)) 
do
if [[ $terbesar_prtm -lt ${array[i]} ]] 
then let terbesar_prtm=${array[i]} 
let j=i 
fi 
done 

terbesar_kedua=0 
index=0 
for((i=0;i<$input;i++))
do 
if [[ $i -eq $j ]] 
then 
let i=i+1 
let i=i-1
else 
if [[ $terbesar_kedua -lt ${array[i]} ]] 
then
let terbesar_kedua=${array[i]} ]] 
then 
let terbesar_kedua=${array[i]} 
let index=i
fi 
fi 
done 
printf “\n” echo “nilai terbesar kedua dalam array adalah : $terbesar_kedua” 
echo “ index array ke : $index” 
read 
clear

;;
2) 
if [[ $input -eq 0]] 
then 
printf “data masih kosong \n” 
else 
echo ${array[@]}
fi 
read 
clear 
;;
3) 
if [[ $input -eq 0 ]] 
then 
printf “\n” 
printf “0\n” 
else 
banyak_data=${#array[@]}; 
flag=0 
for((i=0;i<$banyak_data;i++))
do 
let flag=$(expr “$flag” + “${array[i]}”) 
done 
echo “jumlah all data array : $flag” 
fi 
read 
clear
;;
4) 
printf “\n” 
echo “terimakasih telah memakai programnya azizah” 
exit 1 
esac 
done
