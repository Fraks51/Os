#!/bin/bash
touch ~/report
date_start=$(date +"%m-%d-%Y %T")
mkdir ~/test && echo "catalog test was created successfully" > ~/report; touch ~/test/$date_start.tmp 
ping -c 1 www.net_nikogo.ru 2>> ~/report
