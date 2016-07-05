#!/bin/bash -e
. $(ctx download-resource "components/utils")

telegraf_root=$(create_opt_dir telegraf)

telegraf_file=$(download_component telegraf http://get.influxdb.org/telegraf/telegraf_0.1.9_amd64.deb /opt/telegraf)

install_component telegraf ${telegraf_file}

