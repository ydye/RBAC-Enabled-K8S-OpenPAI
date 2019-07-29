#!/bin/bash

# Prepare certs
mkdir -p certs/
cd certs/
read -p "Enter your domain [www.example.com]: " DOMAIN
openssl genrsa -des3 -out $DOMAIN.key 1024
SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"
openssl req -new -subj $SUBJECT -key $DOMAIN.key -out $DOMAIN.csr
mv $DOMAIN.key $DOMAIN.origin.key
openssl rsa -in $DOMAIN.origin.key -out $DOMAIN.key
openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt

# create secret
cd ..
kubectl create secret generic kubernetes-dashboard-certs --from-file=certs -n kube-system