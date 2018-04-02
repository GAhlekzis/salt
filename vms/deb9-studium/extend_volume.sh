#!/bin/bash

vol_size=$(qvm-volume info -q deb9-studium:root size)

if [ $vol_size -lt 20000000000 ]
then
    qvm-volume extend deb9-studium:root 20G
fi
