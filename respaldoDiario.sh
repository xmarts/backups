#!/bin/bash



export CONTEXTO=$1

. /usr/local/bin/odooresconf.sh


echo "Copia de respaldo para "$CONTEXTO" con el nombre "$CONTEXTO$CARPETA" en "$DIRECTORY/diario
mkdir -p $DIRECTORY/diario


echo "Respaldo db $DIRECTORY/diario/DB-diario-$DIA.sql.gz ...\n"

pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO | gzip -c > $DIRECTORY/diario/DB-diario-$DIA.sql.gz


echo "Respaldo files  $DIRECTORY/diario/FILES-diario-$DIA.sql.gz ...\n"

tar -czf $DIRECTORY/diario/FILESdiario-$DIA.tar.gz  $FILES/$CONTEXTO


