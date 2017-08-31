#!/bin/bash

# /usr/local/fw_rules.sh

# Arquivo para regras de Firewall


#HTTP 
firewall-cmd --permanent --zone=public --add-service=http

echo "HTTP RULE ADD"
