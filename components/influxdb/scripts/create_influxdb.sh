#!/bin/bash -e
. $(ctx download-resource "components/utils")

sudo apt-get update
create_opt_dir influxdb

influxdb_file=$(download_component influxdb https://s3.amazonaws.com/influxdb/influxdb_0.9.4_amd64.deb /opt/influxdb)

install_component influxdb ${influxdb_file}


