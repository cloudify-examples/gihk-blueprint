#!/bin/bash -e
. $(ctx download-resource "components/utils")

create_opt_dir heka
cd /opt/heka

heka_file=$(download_component heka https://github.com/mozilla-services/heka/releases/download/v0.10.0b1/heka_0.10.0b1_amd64.deb /opt/heka)

install_component heka ${heka_file} 

cd /usr/share/heka/lua_filters
sudo curl -O https://raw.githubusercontent.com/mozilla-services/heka/dev/sandbox/lua/filters/influx_batch.lua
