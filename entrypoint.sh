#!/bin/bash

adm_name=${ADMIN_USER:-'admin'}
adm_email=${ADMIN_EMAIL:-'admin@local.host'}
adm_pwd=${ADMIN_PASSWORD:-'admin'}
mongo_host=${MONGODB_HOST:-"127.0.0.1"}
mongo_port=${MONGODB_PORT:-27017}
args=("$@")
pop=${POPULATE:-false}

mongo_settings_string="{\"DB\": \"quokka\",\"HOST\": \"$mongo_host\",\"PORT\": $mongo_port}"

sed -i s/"^MONGODB_SETTINGS.*$"/"MONGODB_SETTINGS = $mongo_settings_string"/ /quokka/quokka/settings.py

python /quokka/manage.py createsuperuser \
  --name "$adm_name" \
  --email "$adm_email" \
  --password "$adm_pwd"

if [[ $pop == true ]]; then
	python /quokka/manage.py populate
fi

python /quokka/manage.py run0 $args