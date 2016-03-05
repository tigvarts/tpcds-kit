#!/bin/bash

echo query$1.tpl > tmp.txt
./dsqgen -input tmp.txt -directory ../query_templates -dialect db2 -scale 10
rm tmp.txt
cat query_0.sql
rm query_0.sql
