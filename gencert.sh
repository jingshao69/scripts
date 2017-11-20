#!/bin/bash

openssl req -x509 -nodes -newkey rsa:1024 -keyout key.pem -out cert.pem -days 365

cat cert.pem key.pem > certificate.pem
