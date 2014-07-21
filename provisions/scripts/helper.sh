#!/usr/bin/env bash

# set variables from console args
for ((i=1; i <= $#; i += 2)) do
    next=$((i + 1))
    eval ${!i}=${!next}
done
