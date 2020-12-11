#!/bin/bash
#Tarih / Saat Etiketi
TODAY=`date +%d-%m-%Y_%H-%M.gz`
#Backup Dosya Adı
ARCHIVE=DB_NAME-$TODAY
#Backup Oluştur
#PostgreSQL'i sunucuya paket yönetcisi üzerinden yüklediyseniz direk pg_dump komutunu kullanabilirsiniz. 'su - postgres -c "pg_dump -U postgres AMZCAD | gzip > /mount/dbfiles/$ARCHIVE'
su - postgres -c "/usr/local/pgsql/bin/pg_dump -U postgres DB_NAME | gzip > /mount/dbfiles/$ARCHIVE"
#20 Günden Eski Backup'ları Sil
find /mount/dbfiles/ -mtime +20 -delete