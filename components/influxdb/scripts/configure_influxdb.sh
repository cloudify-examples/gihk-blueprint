#!/bin/bash -e
. $(ctx download-resource "components/utils")

configure_component influxdb influxdb.conf /etc/opt/influxdb/influxdb.conf
