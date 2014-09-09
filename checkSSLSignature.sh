#!/bin/bash

#default port = 443
PORT=443

usage () {
  echo "Two arguments required"
  echo "Usage: checkSSLSignature.sh www.website.com output_certificate_file"
}



if (( $# != 2))
then
  usage
  exit 1
fi

echo -n | openssl s_client -connect $1:$PORT 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END    CERTIFICATE-/p' > $2
#openssl x509 -noout -text < $2 | grep -m 1 "Signature Algorithm"
SIGNATURE=`openssl x509 -noout -text < $2 | grep -m 1 "Signature Algorithm" | cut -d ":" -f 2 | sed 's/^ *//'`


echo $1, $SIGNATURE


