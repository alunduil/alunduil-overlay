# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Hamcrest framework for matcher objects"
HOMEPAGE="https://github.com/hamcrest/PyHamcrest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples test"

CDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="
	${CDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)"
# $(python_gen_cond_dep 'dev-python/unittest2[${PYTHON_USEDEP}]' 'python2* pypy')
# unittest is bundled default in py2.7 py3s
RDEPEND="${CDEPEND}"
# I'd also refrain from CDEPEND in this case. It's rarely really needed.

python_test() {
	py.test -v || die 'py.test'
}

python_install_all() {
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
# Nomenclature convention is to use lower case.  Use the MY_PN vars to insert 
# into SRC_UR with -> ${P}.tar.gz
