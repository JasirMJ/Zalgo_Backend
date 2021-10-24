#Readme

#####Server Ip : 3.131.99.196

#####Shell Access : ssh -i zaalgoKey.pem bitnami@3.131.99.196

vLnMINbVxGt9

####*Postgres Set up in AWS*

######bitnami@ip-172-31-32-90:~$ sudo -u postgres psql

Password for user postgres : vLnMINbVxGt9
psql (11.13)
Type "help" for help.

######postgres=# CREATE DATABASE ayd;
CREATE DATABASE
postgres=#



###Automated Shell Script for github Fetch Simply run the file

git config credential.helper store
git config --global credential.helper cache

Try manually first time then credential will be stored 

sudo git fetch --all
 
jasirmj

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

sudo git reset --hard origin/main
