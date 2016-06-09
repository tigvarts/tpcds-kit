#!/bin/bash

echo query$1.tpl > tmp.txt
./dsqgen -input tmp.txt -directory ../query_templates -dialect postgres -scale ${1:-1}
rm tmp.txt
cat query_0.sql
rm query_0.sql
