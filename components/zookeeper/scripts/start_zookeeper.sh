#!/bin/bash -e
. $(ctx download-resource "components/utils")

cd /opt/kafka/kafka_2.10-0.8.2.2

ctx logger info "Setting up Zookeeper server..."
sudo bin/zookeeper-server-start.sh -daemon config/zookeeper.properties 
ctx logger info "Zookeeper server is up."