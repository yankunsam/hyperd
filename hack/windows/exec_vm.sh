#!/bin/bash

BASE_DIR=$(dirname $(readlink -f $0))

if [ $# -lt 2 ];then
   echo "./exec_vm.sh <pod-name> <command>"
   exit 1
fi

POD_ID=$1
shift

VM_ID=`${BASE_DIR}/script/get_pod_dm.py ${POD_ID} vmid`
HOST_NAME=`${BASE_DIR}/script/get_pod_dm.py ${POD_ID} hostname`

# exec
${BASE_DIR}/script/console ${HOST_NAME} ${VM_ID} $@
