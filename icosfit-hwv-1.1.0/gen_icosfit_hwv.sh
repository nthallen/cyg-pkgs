#!/bin/sh
function nl_error {
  echo "gen_icosfit_hwv.sh: $*" >&2
  exit 1
}

pkgname=icosfit-hwv
pkgver=1.1.0
pkgrel=2
arch=$pkgname-$pkgver.tar.gz
[ -f $arch ] || nl_error Could not locate archive $arch

tar -xzf $arch

verrel=$pkgver-$pkgrel
srcroot=$PWD/$pkgname-$pkgver
[ -d $srcroot/usr ] || nl_error Could not locate source root
[ -d x86_64/release/$pkgname ] ||
  mkdir -p x86_64/release/$pkgname

cd x86_64/release/$pkgname
tar -Jcf $pkgname-$verrel.tar.xz -C $srcroot usr
tar -Jcf $pkgname-$verrel-src.tar.xz -C $srcroot usr
cat > $pkgname-$verrel.hint << EOF
  sdesc: "Setup scripts for using icosfit with HWV"
  ldesc: "Setup scripts for using icosfit with HWV"
  category: Science
  requires: icosfit
EOF

dest=/usr/src/repo-stage/x86_64/release/$pkgname
[ -d $dest ] || mkdir $dest
cp -uv * $dest
