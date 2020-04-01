#! /bin/bash
ver=4.1.0
unzip icosfit-master.zip
mv icosfit-master icosfit-$ver
tar -cJf icosfit-$ver.tar.xz icosfit-$ver
cygport icosfit.cygport prep compile install package

