#!/bin/bash -e
. $(ctx download-resource "components/utils")

start_service influxdb

sleep 10 #waiting for influxdb server to start

ctx logger info "InfluxDB server is up, creating database name 'db1'..."
sudo curl -G "http://localhost:${influxdb_port}/query" --data-urlencode "q=CREATE DATABASE db1" 

