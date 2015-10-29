#!/bin/bash -e
. $(ctx download-resource "components/utils")

ctx logger info "Preparing environment..."
sudo apt-get update
sudo apt-get install default-jre -y 
sudo apt-get install default-jdk -y 

create_opt_dir kafka
create_opt_dir zookeeper

ctx logger info "Envinronment was set, downlading zookeeper..."

sudo wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/zookeeper/stable/zookeeper-3.4.6.tar.gz
sudo tar -xvf zookeeper-3.4.6.tar.gz 
cd zookeeper-3.4.6/
cp conf/zoo_sample.cfg conf/zoo.cfg 
ctx logger info "Installing zookeeper server..."
sudo nohup bin/zkServer.sh start 2>&1 &
ctx logger info "Zookeeper server is up."

cd /opt/kafka

ctx logger info "Downloading kafka..."
sudo wget http://supergsego.com/apache/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz
sudo tar xvzf kafka_2.10-0.8.2.0.tgz 
cd kafka_2.10-0.8.2.0/

echo 0.0.0.0 $(cat /etc/hostname) | sudo tee -a sudo /etc/hosts >/dev/null
ctx logger info "Uploading zookeeper server..."
sudo bin/zookeeper-server-start.sh -daemon config/zookeeper.properties  #have to check if both "start" section is needed"

ctx logger info "Starting kafka server..."
sudo bin/kafka-server-start.sh -daemon config/server.properties 
ctx logger info "Kafka server is up."
