#!/bin/bash
#
#
# Need create scripts deploy catalog structure with assigned parameters
# like:
#    depth structure catalog, max sizes files, max quantity of iterations etc.

echo "Input: Name directory; Depth; FileSize,kB; MaxQuantityObjects, Length"
read Name Depth Size MaxQu Length
echo
echo "$Name $Depth $Size $MaxQu"
echo
# Function Range random generator; variable Filim set upper limit
Filim=20
MyRand()
{
  shuf -i 0-$Filim -n 1
}
# Function Generator files random quantity filled by zero
rand_creatFile()
{
    quantity_files=$(MyRand)
    echo "Количество файлов: $quantity_files"
    for ((i=0; i < $quantity_files; i++)) {
      dd if=/dev/zero of=$Name/$(rand_name).temp bs=1K count=$Size
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
  ls -lR $Name |wc -l
}



mkdir $Name
rand_creatFile
ls -l $Name

echo "Summ Object in Directory equal: $(Summ_ObjDir)"

#echo "Random number $(MyRand)"
#mkdir -p test/dir--{000..$((MyRand))}
