#!/bin/bash

# CMSJ BACKUP SQL
# Created 2017


function backup_sql() {
#Variaveis

DATE=`date +%d-%m-%Y-%T`
BACKUP_DIR=/home/backup_cmsj/Backup_sql
BACKUP_NAME=mysql-$DATE
BACKUP_NAME_WP=mysql_wp-$DATE
BACKUP_NAME_GLPI=mysql_glpi-$DATE
BACKUP_NAME_OCS=mysql_ocs-$DATE

DB_USER='root'
DB_PASS='root'

mysqldump wordpress -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_WP.sql
mysqldump glpi -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_GLPI.sql
mysqldump ocs -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_OCS.sql

echo "Criando Backup SQL..."

cd $BACKUP_DIR

zip -r $BACKUP_NAME.zip mysql_*.sql

rm -f $BACKUP_DIR/mysql*.sql

if [ -f "$BACKUP_NAME.zip" ]
then
	echo "Arquivo $BACKUP_NAME.zip criado com sucesso"
	echo "Backup MYSQL criado com Sucesso !"
else 

	echo "Erro ao Criar Backup !"
fi

}


backup_sql
