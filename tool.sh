#!/bin/bash

DAILY='./daily'

function help() {
    echo "-d   创建日志"
    echo "-fmt 格式化"
}

function fmt() {
    # 遍历目录
    pngs=`find . -type f -name "*.png"`
    for png in ${pngs[@]}; do
        mv $png ./images
    done
}

function createDailLog() {
    date=`date +"%Y-%m-%d"`
    logFile=$DAILY/$date.md
    if test -f $logFile; then
        echo "ok : $logFile"
    else
        echo "create: $logFile"
        touch $logFile
    fi
}

case $1 in
    "-d")
    	createDailLog
     ;;
    "-fmt")
    	fmt
     ;;
    *)
     	help
     ;;
esac