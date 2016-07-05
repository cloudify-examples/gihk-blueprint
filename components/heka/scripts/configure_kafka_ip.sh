#!/bin/bash -e

ctx logger info "Setting kafka IP Runtime Property."
kafka_IP=$(ctx target instance host_ip)
ctx logger info "Kafka IP is: ${kafka_IP}"
ctx source instance runtime_properties kafka_ip ${kafka_IP}
