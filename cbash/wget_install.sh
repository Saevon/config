#!/bin/bash
curl -O http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz
tar -zxvf wget-1.16.tar.gz
cd wget-1.16/
./configure --with-ssl=openssl
make
sudo make install
rm -rf wget-1.16
rm wget-1.15.tar.gz
