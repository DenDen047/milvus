#!/bin/bash

CURRENT_PATH=$(PWD)

export MILVUS_HOME=$(PWD)/milvus
export PROMETHEUS_HOME=$(PWD)/prometheus
echo ${MILVUS_HOME}
echo ${PROMETHEUS_HOME}

# donlowad configuration files
mkdir -p ${MILVUS_HOME}/conf
cd ${MILVUS_HOME}/conf
if [[ ! -f ./server_config.yaml ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/v0.7.0/core/conf/demo/server_config.yaml
fi
if [[ ! -f ./log_config.conf ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/v0.7.0/core/conf/demo/log_config.conf
fi

cd ${PROMETHEUS_HOME}
if [[ ! -f ./alertmanager.yml ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/master/docker/alertmanager.yml
fi
if [[ ! -f ./prometheus.yml ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/master/docker/prometheus.yml
fi
if [[ ! -f ./server_down.yml ]]; then
    wget https://raw.githubusercontent.com/milvus-io/milvus/master/docker/server_down.yml
fi

# Start docker-compose
cd ${CURRENT_PATH}/docker && \
docker-compose up -d --build

# show the status of `app`
cd ${CURRENT_PATH}/docker && \
docker-compose logs \
    --follow \
    --timestamps \
    app
