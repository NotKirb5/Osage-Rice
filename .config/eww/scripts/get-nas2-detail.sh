#!/bin/bash

df -h --output=avail /mnt/meow/ | tail -n1 | awk '{print $1}'
