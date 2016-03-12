#!/bin/bash -e
. $(ctx download-resource "components/utils")

ctx logger info "Preparing environment..."
sudo apt-get update -y
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java

echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

ctx logger info "Installing Java..."
sudo apt-get install -y oracle-java7-installer
sudo update-java-alternatives -s java-7-oracle
sudo apt-get install -y oracle-java7-set-default

create_opt_dir kafka
cd /opt/kafka

ctx logger info "Downloading kafka..."
sudo wget http://apache.spd.co.il/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz          

ctx logger info "Installing kafka..."
sudo tar xvzf kafka_2.10-0.8.2.2.tgz 
