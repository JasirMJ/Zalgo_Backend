#Readme

#####Server Ip : 3.131.99.196

#####Shell Access : 
ssh -i zaalgoKey.pem bitnami@3.131.99.196

vLnMINbVxGt9

####*Postgres Set up in AWS*

######bitnami@ip-172-31-32-90:~$ 
sudo -u postgres psql

Password for user postgres : vLnMINbVxGt9
psql (11.13)
Type "help" for help.

######postgres=# CREATE DATABASE zalgo_db;
CREATE DATABASE
postgres=#

sudo python manage.py shell
from django.contrib.contenttypes.models import ContentType
ContentType.objects.all().delete()
exit()


###Automated Shell Script for github Fetch Simply run the file

git config credential.helper store
git config --global credential.helper cache

Try manually first time then credential will be stored 

sudo git fetch --all
 
jasirmj

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

sudo git reset --hard origin/main


###Backup Using Postgres 



pg_dump -U postgres {DATABASE_NAME} -h {HOST} > {BASCKUP_FILENAME.sql}

## Backup

pg_dump -U postgres zalgo_db -h localhost > zalgo_db27112021-2.sql

or

python manage.py dumpdata --exclude=auth --exclude=contenttypes > db.json

## Restore

psql -U postgres zalgo_db -h localhost < zalgo_db27112021-2.sql

or

python manage.py loaddata dbbkup.json


***Get Data from server***

Syntax : scp -i {KEY} bitnami@{RECIEVER_IP}:/home/bitnami/{FILE} ./

scp -i "zaalgoKey.pem" bitnami@3.131.99.196:/home/bitnami/media2.zip ./
scp -i "zaalgoKey.pem" bitnami@3.131.99.196:/home/bitnami/zalgo_db27112021-2.sql ./

***Push Data to server***

Syntax : scp -i {KEY} {FILE} bitnami@{RECIEVER_IP}:~

