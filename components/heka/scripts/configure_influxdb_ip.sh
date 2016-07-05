#!/bin/bash -e

ctx logger info "Setting influx_db IP Runtime Property."
influx_db_IP=$(ctx target instance host_ip)
ctx logger info "Influx DB IP is: ${influx_db_IP}"
ctx source instance runtime_properties influx_db_ip ${influx_db_IP}
