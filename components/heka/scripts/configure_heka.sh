#!/bin/bash -e
. $(ctx download-resource "components/utils")

configure_component heka hekad.toml /etc/heka/conf.d/00-hekad.toml

