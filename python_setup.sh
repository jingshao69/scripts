#!/bin/bash

PYTHON_MODULES=configparser:mpmath:netaddr:pillow:requests:PyPDF2

IFS=:

for i in ${PYTHON_MODULES}
do
  sudo pip install $i
done

