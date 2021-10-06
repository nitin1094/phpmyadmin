#!/bin/bash

sudo apt update && upgrade -y

cd /tmp/

wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz

tar xzf xi-latest.tar.gz

cd /tmp/nagiosxi/

sudo ./fullinstall -n