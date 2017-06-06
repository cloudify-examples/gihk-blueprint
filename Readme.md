[![Build Status](https://circleci.com/gh/cloudify-examples/gihk-blueprint.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/cloudify-examples/gihk-blueprint)

# Cloudify grafana-influxdb-heka-kafka blueprint

This repo is an example for a monitoring system application. The system includes 4 main components:
- Influxdb database
- Grafana dashboard
- Kafka queue system
- Heka synchronized service

In addition, the example includes telegraf service as a metrics provider, users can use any other metrics provider as a replacement. 

In order to run the example - just upload the gihk_blueprint.yaml (make sure that the imports versions fits to your cloudify version), create new deployment with gihk_inputs.yaml (make sure that the inputs fits to your credentials and openstack environment) and install it.
When installation is done - access Grafana service on port {machine_ip}:3000 (if it was not changes by the user) and create your own dashboard as you wish (datasource might need to be refresh from grafana web UI). 

### Execute Install

Next you provide those inputs to the blueprint and execute install:


#### For AWS run:

```shell
$ cfy install \
    https://github.com/cloudify-examples/gihk-blueprint/archive/4.0.1.1.zip \
    -b gihk \
    -n aws-blueprint.yaml
```


#### For Azure run:

```shell
$ cfy install \
    https://github.com/cloudify-examples/gihk-blueprint/archive/4.0.1.1.zip \
    -b gihk \
    -n azure-blueprint.yaml
```


#### For Openstack run:

```shell
$ cfy install \
    https://github.com/cloudify-examples/gihk-blueprint/archive/4.0.1.1.zip \
    -b gihk \
    -n openstack-blueprint.yaml
```
