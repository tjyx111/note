#!/bin/bash

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