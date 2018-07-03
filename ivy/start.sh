#!/bin/sh
echo "Starting dotoolkit application ..."
java -DAPP_CONTEXT='F:\Vishal\Dotoolkit\appContext-DOB.xml' -Dhttps.protocols='TLSv1.1,TLSv1.2' -Dport='8082' -jar dotoolkit.jar > /dev/null 2>&1 &
echo "Started dotoolkit application ..."