checkSSLSignature
=================

checkSSLSignature is a bash script that uses openssl to verify the signature algorithm of a website's SSL certificate

Usage: checkSSLSignature.sh www.website.com output_certificate_file

Example: 

```
./checkSSLSignature.sh www.google.com google.cert
```

Outputs 

```
  www.google.com, sha1WithRSAEncryption
```
