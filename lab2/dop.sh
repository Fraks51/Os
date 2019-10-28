#!/bin/bash

#grep -oE '(^#!.*)|(^.*["])|(^[^#]*)' new.sh
head -n 1 new.sh
sed "/^[[:space:]]*#/d;s/[[:space:]]*#[^\"']*$//" new.sh
