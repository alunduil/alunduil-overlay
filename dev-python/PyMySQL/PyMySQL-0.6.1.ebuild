# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="Pure-Python MySQL Driver"
HOMEPAGE="https://github.com/PyMySQL/PyMySQL/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	>=virtual/mysql-4.1
	"
RDEPEND="
	${DEPEND}
	"
