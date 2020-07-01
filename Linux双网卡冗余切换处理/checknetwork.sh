#!/bin/bash

#source /etc/profile
#source ~/.bash_profile

PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/root/bin
export PATH

step=5

for((i = 0; i < 60; i = (i+step))); do

        mii-tool eno1 | grep ok &> /dev/null

        if [ $? -eq 0  ]; then

                ifup eno1 &> /dev/null
        else
                ifdown eno1 &> /dev/null
        fi

        mii-tool eno2 | grep ok &> /dev/null

        if [ $? -eq 0  ]; then

                ifup eno2 &> /dev/null
        else
                ifdown eno2 &> /dev/null
        fi

        sleep 5;

done
exit 0
