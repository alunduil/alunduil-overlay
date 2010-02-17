# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="MSSQL Binding for Python"
HOMEPAGE="http://pymssql.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${V}/${P}.tar.gz"

RESTRICT="mirror"

LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="virtual/python"

src_install() {
	distutils_src_install
}

