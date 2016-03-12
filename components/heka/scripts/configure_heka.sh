#!/bin/bash -e
. $(ctx download-resource "components/utils")

if [ $(ctx node id) = 'heka1' ]; then
	configure_component heka hekad_master.toml /etc/heka/conf.d/00-hekad.toml
else
	configure_component heka hekad_slave.toml /etc/heka/conf.d/00-hekad.toml
fi
