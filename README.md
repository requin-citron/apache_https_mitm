# apache_https_mitm
docker du getto pour faire du mitm https avec apache 

# Usage

TARGET_IP is ip of real https server
DNSNAME is the spoof dns name

```
docker run --rm -it -p443:443 -v ./certs/:/certs -eTARGETIP=25.25.25.151 -eDNSNAME=glpi.lab.local  apache_https_mitm
```