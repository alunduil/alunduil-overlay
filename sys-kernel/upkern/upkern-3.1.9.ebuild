# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="https://github.com/alunduil/upkern"
SRC_URI="https://github.com/alunduil/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="module-rebuild"

DEPEND=""
RDEPEND="
	${DEPEND}
	>=app-portage/gentoolkit-0.3
	module-rebuild? ( sys-kernel/module-rebuild )
	"

RESTRICT="mirror"

src_install() {
	distutils_src_install

	rm "${D}"/usr/bin/upkern.py || die "rm failed"
	rm "${D}"/usr/COPYING || die "rm failed"
	rmdir "${D}"/usr/bin

	doman "${D}"/usr/doc/man/upkern.8
	rmdir "${D}"/usr/doc

	newsbin upkern.py upkern
}
