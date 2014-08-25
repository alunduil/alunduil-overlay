# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="WebSocket client for python. hybi13 is supported"
HOMEPAGE="https://github.com/liris/websocket-client"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${PYTHON_DEPS}"

python_test() {
	./test_websocket.py || die 'test_websocket'
}

python_install_all() {
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}