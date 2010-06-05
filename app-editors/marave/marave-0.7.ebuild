# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Inspired by ommwriter and other similar projects, marave (it means \"nothing\" or \"it doesn't matter\" in guaraní) aims to be a simple, clean text editor that doesn't distract you from your writing."
HOMEPAGE="http://http://code.google.com/p/marave/"

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

SRC_URI="http://marave.googlecode.com/files/${P}.tar.gz"

DEPEND="dev-lang/python
	"
RDEPEND="${DEPEND}"
#PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install
#	rm ${D}/usr/bin/upkern.py
#	rm ${D}/usr/COPYING
#	rmdir ${D}/usr/bin

#	newsbin upkern.py upkern || die "newsbin upkern.py upkern failed"

#	if use doc; then
#		dodoc COPYING || die "dodoc COPYING failed"
#	fi
}

