#!/bin/bash
stack=`ls | grep ".*\.yaml"`
l=0
touch ./script/empty.txt
cat ./script/empty.txt > ./script/stacknames.txt
rm ./script/empty.txt
for i in $stack
   do
       let l=l+1
       echo "Using template $i;"
       echo "Enter name for stack No.$l : "
       read name
       aws cloudformation create-stack --stack-name $name --template-body file://$stack --parameters file://Parameters.json
       if [ $? -eq 0 ]; then
           echo "$name" >> ./script/stacknames.txt
           echo "Creating stack $i, with name $name"
        else
           echo "ERROR ( while creating stack --$i )"
        fi
done