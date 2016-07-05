#!/bin/bash -e
. $(ctx download-resource "components/utils")

create_opt_dir grafana


echo deb https://packagecloud.io/grafana/stable/debian/ wheezy main | sudo tee -a sudo /etc/apt/sources.list >/dev/null

grafana_file=$(download_component grafana https://grafanarel.s3.amazonaws.com/builds/grafana_2.1.3_amd64.deb /opt/grafana)


sudo apt-get install -y adduser libfontconfig
install_component grafana ${grafana_file}

sudo update-rc.d grafana-server defaults 95 10 ### configure the Grafana server to start at boot time


