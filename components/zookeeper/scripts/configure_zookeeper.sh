#!/bin/bash -e
. $(ctx download-resource "components/utils")

echo $(ctx instance runtime_properties vm_kafka_master_ip)	vm-kafka-master | sudo tee -a sudo /etc/hosts >/dev/null
echo $(ctx instance runtime_properties vm_kafka_slave_ip)	vm-kafka-slave | sudo tee -a sudo /etc/hosts >/dev/null
echo $(ctx instance runtime_properties vm_influxdb_kafka_slave_ip)	vm-kafka-extra | sudo tee -a sudo /etc/hosts >/dev/null

ctx logger info "Setting up Zokeeper cluster (creating 'myid' file on /tmp/zookeeper)..."
sudo mkdir /var/zookeeper
sudo chmod -R 777 /var/zookeeper

export ID=$(ctx node properties zookeeper_server_id)

echo ${ID} | sudo tee -a sudo /var/zookeeper/myid > /dev/null

ctx logger info "Configuring zookeeper.properties..."
configure_component kafka producer.properties /opt/kafka/kafka_2.10-0.8.2.2/config/producer.properties
configure_component kafka consumer.properties /opt/kafka/kafka_2.10-0.8.2.2/config/consumer.properties 
configure_component kafka zookeeper.properties /opt/kafka/kafka_2.10-0.8.2.2/config/zookeeper.properties 