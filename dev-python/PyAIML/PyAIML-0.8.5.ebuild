# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="AIML framework written in Python."
HOMEPAGE="http://pyaiml.sourceforge.net/"
MY_PN=$(echo $PN | tr [:upper:] [:lower:])
SRC_URI="mirror://sourceforge/${MY_PN}/${P}.tar.gz"
RESTRICT="mirror"
LICENSE="LGPL-2.1"

IUSE=""

SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="virtual/python"
RDEPEND=""

src_install() {
	distutils_src_install
}
