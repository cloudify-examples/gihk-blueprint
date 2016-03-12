#!/bin/bash -e
. $(ctx download-resource "components/utils")

ctx logger info "Setting up Kafka cluster (creating /var/kafka-logs dir)..."
sudo mkdir /var/kafka-logs
sudo chmod -R 777 /var/kafka-logs

configure_component kafka server.properties /opt/kafka/kafka_2.10-0.8.2.2/config/server.properties 
