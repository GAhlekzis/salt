#!/bin/bash

vol_size= $(qvm-volume info -q kali-rolling:root size)

if [ $vol_size < 20000000000 ]
then
    qvm-volume extend kali-rolling:root 20G
fi
