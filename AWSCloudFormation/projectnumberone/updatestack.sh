#!/bin/bash
stack=`ls | grep ".*\.yaml"`
names=`cat ./script/stacknames.txt`
for j in $stack
do
    for i in $names
    do
        aws cloudformation update-stack --stack-name $i --template-body file://$j --parameters file://Parameters.json
        if [ $? -eq 0 ]; then
            echo "Updating Stack $i using template $j"
         else
            echo "ERROR ( while updating stack --$i )"
        fi
   done
done