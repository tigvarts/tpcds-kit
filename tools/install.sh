#!/bin/bash

scale=${1:-1}
psql=${2:-psql}

echo Compiling...
cp Makefile.suite Makefile
make
echo
echo Making database...
mkdir -p /tmp/tpcds
./dsdgen -terminate N -force -dir /tmp/tpcds -scale $scale
$psql -d postgres -c "drop database if exists tpcds"
$psql -d postgres -c "create database tpcds"
$psql -d tpcds < tpcds.sql
$psql -d tpcds < tpcds_load.sql
$psql -d tpcds < tpcds_ri.sql
rm -rf /tmp/tpcds
echo Finished successfully.
