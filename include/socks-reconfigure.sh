#!/bin/bash
# script to generate a new /etc/danted.conf based on a string passed in on $1
LANG=en_US.UTF-8
export LANG
source '/pia/settings.conf'


echo "$1" > '/etc/danted.conf';