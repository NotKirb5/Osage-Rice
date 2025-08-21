#!/bin/bash

df -h --output=avail /mnt/nyan/ | tail -n1 | awk '{print $1}'
