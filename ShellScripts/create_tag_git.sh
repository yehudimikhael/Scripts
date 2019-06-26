#!/bin/bash

DATE=`date "+%Y%m%d-%H%M"`

body='{
    "tag_name": "release-'$DATE'", 
    "target_commitish": "'${CI_COMMIT_REF_NAME}'", 
    "name": "release-'${CI_COMMIT_SHORT_SHA}'", 
    "body": "Tag", 
    "ref": "'${CI_COMMIT_REF_NAME}'", 
    "draft": false, 
    "prerelease": false
}'

curl -X POST "${CI_API_V4_URL}/projects/${PROJETO_ID}/repository/tags" \
        --header "PRIVATE-TOKEN: ${PRIVATE_TOKEN}" \
        --header "Content-Type: application/json" \
        --data "$body"