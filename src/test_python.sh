#!/bin/bash

mkdir -p /tmp; cd $_

git clone https://github.com/milvus-io/milvus
cd milvus/tests/milvus_python_test

pytest test_connect.py --level=1 --ip=milvus_server
