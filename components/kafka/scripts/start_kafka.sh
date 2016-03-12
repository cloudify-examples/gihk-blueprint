#!/bin/bash -e
. $(ctx download-resource "components/utils")

cd /opt/kafka/kafka_2.10-0.8.2.2

ctx logger info "Starting kafka server..."
sudo bin/kafka-server-start.sh -daemon config/server.properties 
ctx logger info "Kafka server is up."
