#!/bin/bash 
ipAddr=$(ip addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')
export ADDR=$ipAddr

/solver/dist/build/rummikubsolver/rummikubsolver