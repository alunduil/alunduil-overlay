# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="An output formatter for python CLI scripts."
HOMEPAGE="http://github.com/alunduil/pycolorize"

IUSE=""

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

SRC_URI="http://www.alunduil.com/svn/distfiles/pycolorize/${P}.tar.bz2"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install
}
