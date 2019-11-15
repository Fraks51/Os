#!/bin/bash

grep -rh --include=\*.log ACPI /var/log/* > errors.log
grep -he '^/\/.*\/' errors.log 
