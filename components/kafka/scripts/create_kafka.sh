#!/bin/bash -e
. $(ctx download-resource "components/utils")

create_opt_dir kafka
cd /opt/kafka

ctx logger info "Downloading kafka..."
sudo wget http://apache.spd.co.il/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz 
          
ctx logger info "Installing kafka..."
sudo tar xvzf kafka_2.10-0.8.2.2.tgz 
