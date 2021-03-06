#!/bin/bash
set -xu -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
#export MYSQL_HOST=${MYSQL_HOST:-35.74.88.169}
export MYSQL_HOST=192.168.0.12
export MYSQL_HOST_THREE=192.168.0.12
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucon}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isucondition}
export MYSQL_PWD=${MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -pisucon $MYSQL_DBNAME
cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_THREE -P $MYSQL_PORT -u $MYSQL_USER -pisucon $MYSQL_DBNAME