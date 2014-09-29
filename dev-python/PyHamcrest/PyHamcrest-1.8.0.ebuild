# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 pypy )

inherit distutils-r1

DESCRIPTION="Hamcrest framework for matcher objects"
HOMEPAGE="https://github.com/hamcrest/PyHamcrest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples numpy test"

CDEPEND="$(python_gen_cond_dep 'numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )' 'python*')"
DEPEND="
	test? (
		${CDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	py.test -v || die 'py.test'
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
