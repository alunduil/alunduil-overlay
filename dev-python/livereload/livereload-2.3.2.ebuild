# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Python LiveReload is an awesome tool for web developers"
HOMEPAGE="https://github.com/lepture/python-livereload"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/tornado[${PYTHON_USEDEP}]"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	nosetests || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( example/. )

	distutils-r1_python_install_all
}
