#!/bin/bash
REQUIRED_VARS=("DNSNAME" "TARGETIP")

# Iterate over the required variables and check if each one is set
for VAR in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!VAR}" ]; then
        echo "Error: $VAR is not set. Exiting..."
        exit 1
    fi
done

sed -i -e "s/__DNSNAME__/${DNSNAME}/g" /etc/apache2/sites-available/website.conf
sed -i -e "s/__TARGETIP__/${TARGETIP}/g" /etc/apache2/sites-available/website.conf

apachectl -k start
tail -f /var/log/apache2/error.log