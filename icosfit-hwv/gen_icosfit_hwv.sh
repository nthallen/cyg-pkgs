#!/bin/sh
function nl_error {
  echo "gen_icosfit_hwv.sh: $*" >&2
  exit 1
}

pkgname=icosfit-hwv
pkgver=1.1.0
pkgrel=2

verrel=$pkgver-$pkgrel
pkgverrel=$pkgname-$verrel

# We are actually storing the source here, so we don't want to
# overwrite it from an archive. We will generate the cygwin
# archives directly from the source.
#arch=$pkgname-$pkgver.tar.gz
#[ -f $arch ] || nl_error Could not locate archive $arch
#tar -xzf $arch

srcroot=$PWD/$pkgname
[ -d $srcroot/usr ] || nl_error Could not locate source root

[ -d inst ] || mkdir -p inst
cd inst

tar -Jcf $pkgverrel.tar.xz -C $srcroot usr
tar -Jcf $pkgverrel-src.tar.xz -C $srcroot usr

cat > $pkgverrel.hint << EOF
  sdesc: "Setup scripts for using icosfit with HWV"
  ldesc: "Setup scripts for using icosfit with HWV"
  category: Science
  requires: icosfit
EOF

cat > $pkgverrel-src.hint << EOF
  sdesc: "Setup scripts for using icosfit with HWV"
  ldesc: "Setup scripts for using icosfit with HWV"
  category: Science
EOF

dest=/usr/src/repo-stage/x86_64/release/$pkgname
[ -d $dest ] || mkdir $dest
cp -uv * $dest
