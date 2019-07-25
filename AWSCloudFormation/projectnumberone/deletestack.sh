#!/bin/bash
names=`cat ./script/stacknames.txt`
l=0
for i in $names
  do
    echo "Are you sure you want to delete stack with name $i ? [Y/n]"
    read sure
    if [ "$sure" == "y" ] || [ "$sure" == "Y" ] || [ "$sure" == "yes" ]; then
      aws cloudformation delete-stack --stack-name $i
            if [ $? -eq 0 ]; then
             echo "Deleted stack with name: $i"
     else
             l=1
             echo "ERROR ( when deleting stack --$i )"
      fi
     elif [ "$sure" == "n" ] || [ "$sure" == "N" ] || [ "$sure" == "no" ]; then
       l=1
     else
       exit 1
   fi
  done
if [ $l -eq 1 ]; then
    exit 1
 else
    touch ./script/empty.txt
    cat ./script/empty.txt > ./script/stacknames.txt
    rm ./script/empty.txt
fi