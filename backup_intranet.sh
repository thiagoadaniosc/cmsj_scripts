#!/bin/bash

#Arquivo de Backup para  intranet da CMSJ

#VARIAVEIS



DATE=`date +%d-%m-%Y-%T`

#BACKUP_NAME=intranet-$DATE.zip
BACKUP_DIR=/home/backup_cmsj/Backup_intranet
FTP_USER='thiago'
FTP_PASSWD='32462600'
#===============================

function check_backup() {

	if [ -f "$BACKUP_NAME" ]
	then
		echo "Arquivo $BACKUP_NAME criado com sucesso !"
		
	else 
		echo "Erro ao criar arquivo $BACKUP_NAME"
	fi
}

function backup_wordpress(){
	
	echo "Iniciando Backup Wordpress"

	BACKUP_NAME=wordpress-intranet-$DATE.zip

	cd /var/www/html

	zip -r $BACKUP_NAME wordpress/
	echo "Enviando Arquivo Aguarde ..."
	
	ftp -in << FIMFTP 
	
	open 192.168.0.93
	user $FTP_USER $FTP_PASSWD 
	bin
	cd backup_teste
	put $BACKUP_NAME
	close
	bye
FIMFTP
	#mv $BACKUP_NAME $BACKUP_DIR/wordpress

	echo "Backup Wordpress Finalizado"

	#cd $BACKUP_DIR/wordpress
	
	#check_backup $BACKUP_NAME
}

function backup_glpi(){
	
	echo "Iniciando Backup GLPI"

	BACKUP_NAME=glpi-intranet-$DATE.zip

	cd /var/www/html

	zip -r $BACKUP_NAME glpi/

	echo "Enviando Arquivo Aguarde ..."
	
	ftp -in << FIMFTP 
	
	open 192.168.0.93
	user $FTP_USER $FTP_PASSWD 
	bin
	cd backup_teste
	put $BACKUP_NAME
	close
	bye
FIMFTP
	#mv $BACKUP_NAME $BACKUP_DIR/wordpress

	echo "GLPI  Finalizado"

	#cd $BACKUP_DIR/wordpress
	
	#check_backup $BACKUP_NAME
}


function backup_ocs(){
	
	echo "Iniciando Backup GLPI"

	BACKUP_NAME=ocs-intranet-$DATE.zip

	cd /var/www/html

	zip -r $BACKUP_NAME glpi/

	echo "Enviando Arquivo Aguarde ..."
	
	ftp -in << FIMFTP 
	
	open 192.168.0.93
	user $FTP_USER $FTP_PASSWD 
	bin
	cd backup_teste
	put $BACKUP_NAME
	close
	bye
FIMFTP
	#mv $BACKUP_NAME $BACKUP_DIR/wordpress

	echo "OCS  Finalizado"

	#cd $BACKUP_DIR/wordpress
	
	#check_backup $BACKUP_NAME
}



function backup_intranet() {

	BACKUP_NAME=intranet-$DATE.zip
	
	echo "Iniciando Backup da Intranet"

	cd /var/www/

	zip -r $BACKUP_NAME html/

	mv $BACKUP_NAME $BACKUP_DIR

	cd $BACKUP_DIR

	pwd

	if [ -f "$BACKUP_NAME" ]
	then
		echo "Arquivo $BACKUP_NAME criado com sucesso !"
		echo "Backup Intranet criado com sucesso !"
	else
		echo "Erro ao Criar Backup !"
	fi
}

function backup_httpd_conf(){

	BACKUP_NAME=httpd-$DATE.zip
	
	cd /etc/httpd/conf	
	
	zip -r $BACKUP_NAME httpd.conf
	
	mv $BACKUP_NAME /home/backup_cmsj/Backup_intranet
	
	ls -ltr
	
	
}


backup_intranet

backup_httpd_conf

#read BACKUP_NAME

#check_backup $BACKUP_NAME
