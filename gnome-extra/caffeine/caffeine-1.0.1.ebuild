# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A status bar application able to temporarily prevent the activation of both the screensaver and the \"sleep\" powersaving mode."
HOMEPAGE="http://launchpad.net/caffeine"

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

SRC_URI="http://launchpad.net/${PN}/${PV%.*}/${PV}/+download/${P}.tar.gz"

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

