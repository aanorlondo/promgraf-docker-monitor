#!/bin/bash

export SELF_HOSTNAME=$(hostname)
export DOCKER_HOSTNAME=host.docker.internal # using macOs

# Read the setup_with_vars.sql file
input_prom_file_path="../config/prometheus_template.yml"
output_prom_file_path="../config/prometheus.yml"

# Replace the environment variable placeholders with their values
envsubst < $input_prom_file_path > $output_prom_file_path