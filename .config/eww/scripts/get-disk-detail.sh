#!/bin/bash

df -h --output=avail /home | tail -n1 | awk '{print $1}'
