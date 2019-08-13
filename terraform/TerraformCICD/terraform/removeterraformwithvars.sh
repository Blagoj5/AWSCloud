#!/bin/bash
for i in `cat ./varfile.txt`
 do
    terraform destroy -var-file $i
done
if [ $? == 0 ]; then
    rm ./varfile.txt
fi