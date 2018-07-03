#!/bin/sh

WORKING_DIR=$1

if [ $# -eq 0 ]; then
    echo "Enter the working directory"
 else
    cd $WORKING_DIR
    mvn compile
fi