#!/bin/bash



export CONTEXTO=$1

. /usr/local/bin/odooresconf.sh

if [ "$2" = "local" ]; then
	export S3="n"
fi



if [ "$S3" = "y" ]; then
	echo "Respaldo SQL S3  s3://$SPACENAME/$SPACEPATH/ $CONTEXTO-DB-diario-$DIA.sql.xz "
	
#	pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO | xz -c -$COMRATIO  - | s3cmd put - s3://$SPACENAME/$SPACEPATH/$CONTEXTO-DB-diario-$DIA.sql.xz
	pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO | gzip -c -$COMRATIO   | s3cmd put - s3://$SPACENAME/$SPACEPATH/$CONTEXTO-DB-diario-$DIA.sql.gz

	
        echo "Respaldo FILES S3  s3://$SPACENAME/$SPACEPATH/ $CONTEXTO-FILESdiario-$DIA.tar.xz "

#	tar -cf - $FILES/$CONTEXTO | xz -c -$COMRATIO  - | s3cmd put - s3://$SPACENAME/$SPACEPATH/$CONTEXTO-FILESdiario-$DIA.tar.xz
	tar -cf - $FILES/$CONTEXTO | gzip -c -$COMRATIO   | s3cmd put - s3://$SPACENAME/$SPACEPATH/$CONTEXTO-FILESdiario-$DIA.tar.gz


	#s3cmd put $DIRECTORY/diario/$CONTEXTO-DB-diario-$DIA.sql.gz  s3://$SPACENAME/$SPACEPATH/
	#s3cmd put $DIRECTORY/diario/$CONTEXTO-FILESdiario-$DIA.tar.gz  s3://$SPACENAME/$SPACEPATH/
else
	echo "Copia de respaldo para "$CONTEXTO" con el nombre "$CONTEXTO$CARPETA" en "$DIRECTORY/diario
	mkdir -p $DIRECTORY/diario


	echo "Respaldo db $DIRECTORY/diario/$CONTEXTO-DB-diario-$DIA.sql.gz ...\n"

	pg_dump -U $DBUSER -h $DBHOST -p $DBPORT  $CONTEXTO | gzip -c > $DIRECTORY/diario/$CONTEXTO-DB-diario-$DIA.sql.gz


	echo "Respaldo files  $DIRECTORY/diario/$CONTEXTO-FILES-diario-$DIA.sql.gz ...\n"

	tar -czf $DIRECTORY/diario/$CONTEXTO-FILESdiario-$DIA.tar.gz  $FILES/$CONTEXTO

fi
