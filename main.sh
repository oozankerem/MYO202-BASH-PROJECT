#!/bin/bash

# Ozan Kerem
# 2420171039
# Sertifika Bağlantıları:
# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=lK1hwq46DD
# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=0Koh8emYP1
# https://credsverse.com/credentials/5eab3179-c5bb-4af0-80de-a18d5f78114d

date -Iseconds > report.log

wmic cpu get name >> report.log
wmic memorychip get capacity >> report.log
wmic baseboard get product,Manufacturer >> report.log
wmic csproduct get uuid >> report.log
getmac >> report.log

echo "Lütfen parolayı giriniz:"
read -s PAROLA

gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 -o report.log.gpg report.log

rm report.log