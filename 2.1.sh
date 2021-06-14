#!/bin/bash
#
#
# Need create scripts deploy catalog structure with assigned parameters
# like:
#    depth structure catalog, max sizes files, max quantity of iterations etc.

echo "Input: Name directory; Depth; FileSize,kB; Max Iterations, Length of Name"
read Name Depth Size MaxQu Length
echo
# Function Range random generator; variable Filim set upper limit
curDir=$(pwd)
Filim=20
MyRand()
{
  shuf -i 0-$Filim -n 1
}
# Function random quantity Generator files filled by zero
rand_creatFile()
{
    quantity_files=$(MyRand)
    #echo "Количество файлов: $quantity_files"
    for ((i=0; i < $quantity_files; i++)) {
      dd if=/dev/zero of=$(pwd)/$(rand_name).temp bs=1K count=$Size
    }
}
# Function Generator random file-names
rand_name()
{
  cat /dev/urandom | tr -dc A-Za-z0-9 | head -c "$(shuf -i 1-$Length -n 1)"
}
# Function Calculation function for quantity objects in parent directory
Summ_ObjDir()
{
  ls -lR $(pwd) |wc -l
}

mkdir $Name
cd $Name
rand_creatFile
#____________________________________________________________________________
startsFlder=$(MyRand)

for n in $(seq 1 $startsFlder);
do
  if [ $(ls -laR ../ | wc -l) -le $MaxQu ]
    then
        depth=$Depth
        for i in $(seq 1 $depth);
        do
          dir="$(rand_name)"
          mkdir -p $dir;
          pushd $dir;
        done;
        #echo $((RANDOM%100)) > file$((RANDOM%100)); # Создает рандомный файл
        rand_creatFile
        for i in $(seq 1 $depth);
        do
        popd;
        rand_creatFile
        done;
    else
        echo " Достигнут лимит максимального количества итераций! "
        break
      fi
done;
echo "Кол-во папок и файлов: $(ls -laR ../ | wc -l)  "
echo "Кол-во итераций: $MaxQu"
