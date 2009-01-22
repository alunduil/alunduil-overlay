# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/python-kernel-updater/"
SRC_URI="http://www.alunduil.com/svn/upkern/trunk/dist/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86 ~sparc"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
    sys-kernel/module-rebuild"

src_install() {
    distutils_src_install
	newbin upkern.py upkern || die "newbin failed"
    dodoc ChangeLog || die "dodoc failed"
}

