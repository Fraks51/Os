#!/bin/bash 

cpulimit -l 20 /home/frak/OS_labs/Os/lab4/mul.sh &
nice -n 20 /home/frak/OS_labs/Os/lab4/mul2.sh &
