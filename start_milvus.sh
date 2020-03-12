#!/bin/bash

MILVUS_HOME=$(PWD)
echo ${MILVUS_HOME}

# donlowad configuration files
mkdir -p conf
cd conf
if [[ ! -f ./server_config.yaml ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/v0.7.0/core/conf/demo/server_config.yaml
fi
if [[ ! -f ./log_config.conf ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/v0.7.0/core/conf/demo/log_config.conf
fi

# Start Milvus from https://hub.docker.com/r/milvusdb/milvus
docker run --rm --name milvus_cpu \
    -p 19530:19530 \
    -p 19121:19121 \
    -p 9091:9091 \
    -v ${MILVUS_HOME}/db:/var/lib/milvus/db \
    -v ${MILVUS_HOME}/conf:/var/lib/milvus/conf \
    -v ${MILVUS_HOME}/logs:/var/lib/milvus/logs \
    -v ${MILVUS_HOME}/wal:/var/lib/milvus/wal \
    milvusdb/milvus:0.7.0-cpu-d031120-de409b