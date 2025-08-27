#!/bin/bash
set -e

for dump in /var/lib/neo4j/import/*.dump; do
    dbname=$(basename "$dump" .dump)
    echo "===> Cargando $dbname desde $dump"
    neo4j-admin database load --from-path=/var/lib/neo4j/import "$dbname" --overwrite-destination=true
done
