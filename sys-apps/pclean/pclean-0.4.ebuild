# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Automated Gentoo /etc/portage/package.* cleaner."
HOMEPAGE="http://www.alunduil.com/programs/pclean/"
SRC_URI="http://www.alunduil.com/svn/distfiles/pclean/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="doc"

DEPEND="dev-lang/python
	>=app-portage/gentoolkit-0.3
	"
RDEPEND="${DEPEND}"

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install
	rm ${D}/usr/bin/pclean.py
	rm ${D}/usr/COPYING
	rmdir ${D}/usr/bin

	newsbin pclean.py pclean || die "newsbin pclean.py pclean failed"

	if use doc; then
		dodoc COPYING || die "dodoc COPYING failed"
		#dodoc README || die "dodoc README failed"
	fi
}

