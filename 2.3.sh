#!/bin/bash
read -p "Please, input source directory:" source_dir
read -p "Please, input destination directory:" destination_dir
RealPath_source=$(realpath $source_dir)
RealPath_destin=$(realpath $destination_dir)
OccupPlace=$(du -s $source_dir | cut -f1)
AvailSpace=$(df $destination_dir | awk '{print $4}' | tail -n 1)
# Define added functions
date_gz(){ # Numbering archives by time
  name=$(date +%g%m%d_%H%S)   #take time&date now
  cd $RealPath_source         #enter into source directory
  # Compress by gzip/make date-name/archive into destination directory
  tar -zcf "$source_dir"_$name.gz *
  mv "$source_dir"_$name.gz $RealPath_destin
}
iterat_ar(){ #Make archives by one by one
  cd $RealPath_source         #enter into source directory
  read -p "Input Max quantity of copy:" x_copy
    d_copy=$(($x_copy-1))
    x_copy=$(($x_copy-1))
  while [[ $x_copy -ge 0 ]]; do
    tar -zcf 0"$x_copy"_$name.gz *
    mv 0"$x_copy"_$name.gz $RealPath_destin
    x_copy=$(($x_copy-1))
  done
  rm $RealPath_destin/0"$d_copy"_$name.gz
}

echo
#Test source_dir
if [ -d $RealPath_source ]
  then
  echo "The $source_dir directory exists"
  else
  echo "The $source_dir directory does not exist"
fi
#Test destination_dir
if [ -d $RealPath_destin ]
  then
  echo "The $destination_dir directory exists"
  else
  echo "The $destination_dir directory does not exist"
fi
#test identical and parents
if [[ "$RealPath_source" == "$RealPath_destin" ]]; then
  echo "The directories are identical"
elif [[ "$RealPath_destin" == *"$source_dir"* ]]; then
  echo "Destination dir parent for source dir"
elif [[ "$RealPath_source" == *"$destination_dir"* ]]; then
  echo "Source dir parent for destination dir"
else echo "No identical & parents directories"
fi
echo
#copy directories
if (("$OccupPlace" < "$AvailSpace")); then
          echo -e "How do you wanna push data into archive:\nMake note with time&date -1\nMake rotation number archive -2"
          while true; do
          read yn
              case $yn in
                  1* ) date_gz ; break ;;
                  2* ) iterat_ar; break ;;
                  * ) echo "Please type 1 or 2";;
              esac
          done
         #cp -pr $source_dir/* $destination_dir
         #echo "Directory copied"
 else
        echo "Not enough space on destination source, do you want copy files?"
while true; do
read -p "type Y to continue or N to abort:" yn
    case $yn in
        [Yy]* ) cp -pr $source_dir/* $destination_dir;;
        [Nn]* ) break;;
        * ) echo "Please type y or n";;
    esac
done
fi
