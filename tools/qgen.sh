#!/bin/bash

echo query${1}.tpl > tmp.txt
./dsqgen -input tmp.txt -directory ../query_templates -dialect ${2:-postgres} -scale ${3:-1} -rngseed $RANDOM
rm tmp.txt
cat query_0.sql
rm query_0.sql
