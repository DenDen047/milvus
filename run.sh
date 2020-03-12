#!/bin/bash

export MILVUS_HOME=$(PWD)
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

# Start docker-compose
cd ${MILVUS_HOME}/docker && \
docker-compose up --build
