#!/bin/bash
stack=`ls | grep ".*\.yaml"`
names=`cat ./script/stacknames.txt`
for j in $stack
do
    for i in $names
    do
        aws cloudformation update-stack --stack-name $i --template-body file://$j --parameters file://Parameters.json
        echo "Updating Stack $i using template $j"
   done
done