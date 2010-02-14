# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/upkern/"

IUSE="doc"

KEYWORDS="-* amd64 x86 ~sparc"
LICENSE="GPL-2"
SLOT="0"

SRC_URI="http://www.alunduil.com/svn/distfiles/upkern/${P}.tar.bz2"

DEPEND="dev-lang/python"
#RDEPEND=""
PDEPEND="sys-kernel/module-rebuild"

RESTRICT="mirror"
PROPERTIES=""


src_install() {
	distutils_src_install
	newbin upkern.py upkern || die "newbin failed"
	
	if use doc; then
		dodoc ChangeLog || die "dodoc failed"
	fi
}

