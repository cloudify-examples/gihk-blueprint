#!/bin/bash -e
. $(ctx download-resource "components/utils")

configure_component telegraf telegraf.toml /etc/opt/telegraf/telegraf.conf
