# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="nose2 is the next generation of nicer testing for Python"
HOMEPAGE="https://github.com/nose-devs/nose2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

CDEPEND=">=dev-python/six-1.1[${PYTHON_USEDEP}]"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-1.0.5[${PYTHON_USEDEP}] )
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	"${PYTHON}" -m nose2.__main__ || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )

	distutils-r1_python_install_all
}
