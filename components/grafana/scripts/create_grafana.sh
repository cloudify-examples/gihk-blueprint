#!/bin/bash -e
. $(ctx download-resource "components/utils")

create_opt_dir grafana
cd /opt/grafana

grafana_file=$(download_component grafana https://grafanarel.s3.amazonaws.com/builds/grafana_2.6.0_amd64.deb /opt/grafana)

sudo apt-get install -y adduser libfontconfig

install_component grafana ${grafana_file}
