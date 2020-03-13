#!/bin/bash

mkdir -p /tmp; cd $_

git clone https://github.com/milvus-io/milvus
cd milvus/tests/milvus_python_test

pytest . --level=1 --ip=milvus_server
