#!/bin/sh

if [ -r /home/xiaoranzzz/.afterstep/.postcard ] 
then echo -n 
else rm /home/xiaoranzzz/.afterstep/non-configurable/send_postcard.sh 
exit
fi
x-terminal-emulator -e "/usr/share/afterstep/tools/postcard.sh"
if [ -r /home/xiaoranzzz/.afterstep/.postcard ] 
then echo -n 
else rm /home/xiaoranzzz/.afterstep/non-configurable/send_postcard.sh 
fi
