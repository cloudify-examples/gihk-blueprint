#!/bin/bash -e
. $(ctx download-resource "components/utils")

start_service grafana-server

sleep 10
sudo apt-get install libwww-perl -y

ctx logger info "Configuring influxdb to be grafana data source..."

curl 'http://admin:admin@localhost:'"${grafana_port}"'/api/datasources' -X POST -H "Content-Type: application/json;charset=UTF-8" --data-binary '{"name":"data", "type":"InfluxDB 0.9.x", "url":"http://localhost:'"${influxdb_port}"'", "access":"proxy", "isDefault":true, "basicAuth":false, "database":"db1", "user":"admin", "password":"admin"}'

