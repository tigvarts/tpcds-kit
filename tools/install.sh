#!/bin/bash

echo Compiling...
cp Makefile.suite Makefile
make
echo
echo Making database...
./dsdgen -terminate N -force -dir /tmp -scale ${1:-1}
psql -d postgres -c "drop database if exists tpcds"
psql -d postgres -c "create database tpcds"
psql -d tpcds < tpcds.sql
psql -d tpcds < tpcds_load.sql
psql -d tpcds < tpcds_ri.sql
rm /tmp/*.dat
echo Finished successfully.
