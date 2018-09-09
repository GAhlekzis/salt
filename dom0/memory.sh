#!/bin/sh

CMD="virsh -c xen://"

for vm in $($CMD list --name)
do    
    full_info=$($CMD dominfo $vm);
    used=$(echo $full_info | awk -F'Used memory: |KiB' '{print $3}' | tr '\n' ' ')
    max=$(echo $full_info | awk -F'Max memory: |KiB' '{print $2}' | tr '\n' ' ')
    echo -e $vm ' \t ' $(($used / (1024)))/$(($max / (1024))) MiB
done
