#!/bin/bash

ambiente=("eva-int-stg" "eva-int-uat" "eva-int-onda2" "eva-int-azul" "eva-int-uat-next" "eva-int-rc" "eva-int-verde" "eva-int-laranja" "eva-int-merge")
dns_name='mybackstage.qa.globoi.com/stress'

CLIENTID='oBylAqS1jlx3jeQR+vzFtA=='
SECRETID='qKZtYPWJ+pHLIERRogenUw=='
URL='https://accounts.backstage.qa.globoi.com/token'
TOKEN=$(curl -X POST -u "$CLIENTID:$SECRETID" -d "grant_type=client_credentials" $URL | python -c "import sys, json; print json.load(sys.stdin)['access_token']")
# #echo $TOKEN

for amb in ${ambiente[@]}
do
    echo $amb
    endereco="https://$amb.$dns_name"
    #echo $endereco
    result=$(curl -X GET -sL -w "%{http_code}\\n" $endereco -so /dev/null \
         -H "Authorization: Bearer $TOKEN")
    echo $result
    echo "##################" 
    
done
