#!/bin/bash

# /usr/local/start_services.sh

# Arquivo para Inicialização de Serviços

# nmap localhost


function start_apache() {
	systemctl start httpd
	echo "Service: Apache - Iniciado"
}

function stop_apache(){
	systemctl stop httpd
	echo "Service: Apache - Desativado"
}

function start_mariadb(){
	systemctl start mariadb
	echo "Service: MariaDB(Mysql) - Iniciado"
}

function stop_mariadb(){
	systemctl stop mariadb
	echo "Service: MariaDB(Mysql) - Desativado"
}


function status_all() {
	nmap localhost
}

function start_all_services() {
	

if [ "`systemctl is-active httpd`" != "active" ]
then
	start_apache
fi

if [ "`systemctl is-active mariadb`" != "active" ]
then
	start_mariadb
fi

}

start_all_services

status_all
