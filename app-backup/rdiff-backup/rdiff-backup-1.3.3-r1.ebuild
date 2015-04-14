# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-backup/rdiff-backup/rdiff-backup-1.3.3.ebuild,v 1.11 2014/08/10 01:54:02 patrick Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Local/remote mirroring+incremental backup"
HOMEPAGE="http://rdiff-backup.nongnu.org/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="examples"

DEPEND="
	>=net-libs/librsync-0.9.7
"
RDEPEND="
	dev-python/pyxattr[${PYTHON_USEDEP}]
	dev-python/pylibacl[${PYTHON_USEDEP}]
"

python_install_all() {
	use examples && local EXAMPLES=( examples.html )

	distutils-r1_python_install_all
}
