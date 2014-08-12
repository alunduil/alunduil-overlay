# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_3 )

inherit distutils-r1

DESCRIPTION="console colouring for python"
HOMEPAGE="http://gfxmonk.net/dist/0install/python-termstyle.xml"
SRC_URI="http://gfxmonk.net/dist/0install/impl/${PN}/${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${PYTHON_DEPS}"

python_test() {
	./test2.py || die 'test2.py'
	./test3.py || die 'test3.py'
}
