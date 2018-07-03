#!/bin/sh
echo "Stopping dotoolkit application server..."
ps -eaf | grep dotoolkit | awk -F' ' '{print $2}'| xargs kill -9
echo "Stopped dotoolkit application server..."