#!/bin/sh

CONFIG_DIR="$(dirname -- "$0")"

. $CONFIG_DIR/shell-config

ulimit -m $MEMORY_USAGE

ACTION=$1

deploy(){
        APP_NAME=$1
        ZIP_FILE_LOCATION=$2
        if [ $# -eq 0 ]; then
            echo "Kindly enter two params appname and zipfile"
         elif [ -z "$2" ]; then
            echo "kindly provide the zip file location"
         else
            cd $MULE_HOME
            SERVER_TOKEN="$(anypoint-cli runtime-mgr server token)"
            echo $SERVER_TOKEN
            ./amc_setup -H $SERVER_TOKEN $SERVER_NAME
            ./mule
            anypoint-cli runtime-mgr standalone-application deploy $APP_NAME $ZIP_FILE_LOCATION
        fi
}

start(){
        APP_NAME=$1
        if [ $# -eq 0 ]; then
            echo "The app name is missing"
         else
            anypoint-cli runtime-mgr standalone-application start $APP_NAME
        fi
}

stop(){
        APP_NAME=$1
        if [ $# -eq 0 ]; then
           echo "The app name is missing"
         else
            anypoint-cli runtime-mgr standalone-application stop $APP_NAME
        fi
}

restart(){
        APP_NAME=$1
        if [ $# -eq 0 ]; then
            echo "The app name is missing"
         else
            anypoint-cli runtime-mgr standalone-application restart $APP_NAME
        fi
}

case $ACTION in
        deploy)
                deploy $2 $3
                ;;
        start)
                start $2
                ;;
        stop)
                stop $2
                ;;
        restart)
                restart $2
                ;;
        *)
                echo "Kindly specify available options OPTIONS:- [deploy, start, stop, restart]"
                ;;
esac