#!/bin/bash 

nice -n 0 /home/frak/OS_labs/Os/lab4/mul.sh &
cpulimit -l 20 /home/frak/OS_labs/Os/lab4/mul.sh &
nice -n 20 /home/frak/OS_labs/Os/lab4/mul2.sh
