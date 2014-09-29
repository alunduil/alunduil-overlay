# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="Filesystem events monitoring"
HOMEPAGE="http://github.com/gorakhargosh/watchdog"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

CDEPEND="
	>=dev-python/argh-0.8.1[${PYTHON_USEDEP}]
	dev-python/pathtools[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.09[${PYTHON_USEDEP}]
"
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		${CDEPEND}
		dev-python/coverage[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/unittest2[${PYTHON_USEDEP}]' 'python2* pypy')
	)
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	./run_tests.py || die 'run_tests.py'
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )

	distutils-r1_python_install_all
}

pkg_postinst() {
	elog "optional dependencies:"
	elog "  dev-python/argcomplete — bash completion"
}
