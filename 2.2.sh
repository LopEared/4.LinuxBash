#!/bin/bash

# 2 parameters: source_dir & destination_dir
# Non-parents
# Non-equals names
# Calculate space occupaied source_dir
# Calculate space free  with destination_dir
# Copy source_dir  into destination_dir if enough free space on disk storage
# with all atributes!!!
# Make warning!
read -p "Please, input source directory:" source_dir
read -p "Please, input destination directory:" destination_dir
RealPath_source=$(realpath $source_dir)
RealPath_destin=$(realpath $destination_dir)
OccupPlace=$(du -s $source_dir | cut -f1)
AvailSpace=$(df $destination_dir | awk '{print $4}' | tail -n 1)
echo
#Test source_dir
if [ -d $RealPath_source ]
  then
  echo "The $source_dir directory exists"
  else
  echo "The $source_dir directory does not exist"
fi
echo
#Test destination_dir
if [ -d $RealPath_destin ]
  then
  echo "The $destination_dir directory exists"
  else
  echo "The $destination_dir directory does not exist"
fi
echo
#test identical and parents
if [[ "$RealPath_source" == "$RealPath_destin" ]]; then
  echo "The directories are identical"
elif [[ "$RealPath_destin" == *"$source_dir"* ]]; then
  echo "Destination dir parent for source dir"
elif [[ "$RealPath_source" == *"$destination_dir"* ]]; then
  echo "Source dir parent for destination dir"
#else echo "No identical&parents dir"
fi

#copy directories
if (("$OccupPlace" < "$AvailSpace")); then
         cp -pr $source_dir/* $destination_dir
         echo "Directory copied"
 else
        echo "Not enough space on destination source, do you want copy files?"
while true; do
read -p "type Y to continue or N to abort:" yn
    case $yn in
        [Yy]* ) cp -pr $source_dir $destination_dir;;
        [Nn]* ) break;;
        * ) echo "Please type y or n";;
    esac
done
fi
