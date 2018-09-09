#!/bin/sh

CMD="virsh -c xen://"

full_info=$($CMD dominfo Domain-0);
used=$(echo $full_info | awk -F'Used memory: |KiB' '{print $3}' | tr '\n' ' ')
max=$(echo $full_info | awk -F'Max memory: |KiB' '{print $2}' | tr '\n' ' ')
echo Max: $(($max / (1024**2))) GB
echo Used: $(($used / (1024**2))) GB
