#! /bin/bash
# backup the qfcloudb database data
pg_dump --verbose --data-only -f qfcloudb-dump-$(date -I).sql -d 'postgresql://qfcloudb_owner:change_me@change_me:5432/qfcloudb?sslmode=require&channel_binding=require'

# backup the host databases schemas 
pg_dumpall --verbose --schema-only -f qfcloudb-dumpall-$(date -I).sql -d 'postgresql://qfcloudb_owner:change_me@change_me:5432/qfcloudb?sslmode=require&channel_binding=require' --exclude-database=template?

# backup the qfcloud-storage bucket
mc cp --recursive minio/qfcloud-storage .
tar -cf qfcloud-storage-$(date -I).tar qfcloud-storage
gzip qfcloud-storage-$(date -I).tar
rm -r qfcloud-storage
