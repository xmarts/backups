#!/bin/bash

export CONTEXTO=$1

. /usr/local/bin/obconf.sh




echo "Copia de respaldo para "$CONTEXTO" con el nombre "$CONTEXTO$CARPETA
mkdir -p $DIRECTORY/dominical

echo "borra anterior "
rm -rf $DIRECTORY/dominical/$CONTEXTO
rm -rf $DIRECTORY/dominical/wabapps-$CONTEXTO
rm -rf $DIRECTORY/dominical/$CONTEXTO.tar.bz2


#echo "Copiando SRC destino "$SRC$CONTEXTO$CARPETA

#cp -R $SRC$CONTEXTO $DIRECTORY/dominical

#echo "Respaldando contexto "$WEBAPPS$CONTEXTO

#cp -R $WEBAPPS$CONTEXTO $DIRECTORY/dominical/wabapps-$CONTEXTO/

echo "Respaldo db ...  $DIRECTORY/dominical/DB-dominical.sql  \n"

#pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO | gzip -c > $DIRECTORY/dominical/DB-dominical.sql.gz

pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO  > $DIRECTORY/dominical/DB-dominical.sql

echo "Respaldo fuentes y webapps ... $DIRECTORY/dominical/$CONTEXTO.tar.bz2  \n"

tar -cjf $DIRECTORY/dominical/$CONTEXTO.tar.bz2 $DIRECTORY/dominical/DB-dominical.sql $SRC$CONTEXTO  $WEBAPPS$CONTEXTO

rm -rf $DIRECTORY/dominical/DB-dominical.sql
