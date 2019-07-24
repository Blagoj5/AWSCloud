#!/bin/bash
names=`cat ./stacknames.txt`
for i in $names
  do
    aws cloudformation delete-stack --stack-name $i
    echo "Deleted stack with name: $i"
  done
touch ./empty.txt
cat ./empty.txt > ./stacknames.txt
rm ./empty.txt