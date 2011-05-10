# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/upkern/"

IUSE="module-rebuild"

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
	rm "${D}"/usr/bin/upkern.py
	rm "${D}"/usr/COPYING
	rmdir "${D}"/usr/bin

	doman "${D}"/usr/doc/man/upkern.8 || die "doman upkern.8 failed"
	rmdir "${D}"/usr/doc

	newsbin upkern.py upkern || die "newsbin upkern.py upkern failed"
}
