## DESCARGAR 

```sh
mkdir -p /usr/local/src/backups
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
