#!/usr/bin/env bash 

list=`ls lib*.3.3.1`

for i in $list; do
    echo "linking $i"
    ln -s $i ${i%.so.3.3.1}3.so.3.3
done
