#!/bin/bash
touch emails.lst

grep -ohrE '[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]+' /etc/ | grep -E '[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]+' > emails.lst
