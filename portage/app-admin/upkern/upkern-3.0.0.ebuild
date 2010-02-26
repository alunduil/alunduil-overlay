# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/upkern/"

IUSE="doc module-rebuild"

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

SRC_URI="http://www.alunduil.com/svn/distfiles/upkern/${P}.tar.bz2"

DEPEND="dev-lang/python
	>=app-portage/gentoolkit-0.3
	"
RDEPEND="${DEPEND}"
PDEPEND="module-rebuild? ( sys-kernel/module-rebuild )"

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install
	rm ${D}/usr/bin/upkern.py

	newsbin upkern.py upkern || die "newsbin upkern.py upkern failed"

	if use doc; then
		dodoc COPYING || die "dodoc COPYING failed"
		#dodoc README || die "dodoc README failed"
	fi
}

