#!/bin/bash -e
. $(ctx download-resource "components/utils")

start_service telegraf

sudo service heka restart 


