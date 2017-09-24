## DESCARGAR 

```sh
cd /usr/local/src/
git clone https://github.com/xmarts/backups.git
```

## LINK

```sh
ln -s /usr/local/src/backups/*.sh /usr/local/bin/
chmod 770 /usr/local/src/backups/*.sh
```

## CRONTAB

```sh
1 1 * * * root  service  odoo stop ;killall odoo; respaldoDiario.sh BASEDEDATOS ; service  odoo start
```

## VALIDAR LOS PERMISOS DE PGDUMP

## Respaldo en Amazon o Digital Ocean

```sh
sudo apt-get install python-setuptools
cd /usr/local/src/
wget https://downloads.sourceforge.net/project/s3tools/s3cmd/2.0.0/s3cmd-2.0.0.tar.gz
tar xvfz s3cmd-*
cd s3cmd-*
sudo python setup.py install
s3cmd --configure
```

Ahora solo configurar odooresconf.sh
```sh
export S3=y     y para habilitar n para descartar
export SPACENAME=xmarts  nombre del espacio de trabajo
export SPACEPATH=carpeta   nombre de la carpeta donde estara el espacio de trabajo 
```
Ejecutar 

```sh
respaldoDiario.sh BASEDEDATOS 
#con respaldo local 
respaldoDiario.sh BASEDEDATOS  local
```

