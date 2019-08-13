#!/bin/bash
echo "Enter the variable file"

for i in {1..100}
  do
    read var
    terraform plan -var-file $var
    if [ $? == 0 ]; then
        echo "terraform apply -var-file $var"
        echo "$var" > varfile.txt
        break
    else
        echo "ERROR, try again"
        continue
    fi
done