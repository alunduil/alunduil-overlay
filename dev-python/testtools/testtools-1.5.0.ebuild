# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/testtools/testtools-1.3.0.ebuild,v 1.2 2014/12/26 07:52:43 idella4 Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Extensions to the Python standard library unit testing framework"
HOMEPAGE="https://github.com/testing-cabal/testtools"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="doc test"

CDEPEND="
	dev-python/extras[${PYTHON_USEDEP}]
	dev-python/mimeparse[${PYTHON_USEDEP}]
	>=dev-python/unittest2-0.8.0[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${CDEPEND}
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '<dev-python/jinja2-2.7[${PYTHON_USEDEP}]' 'python3_2')
	)
	test? ( dev-python/fixtures[${PYTHON_USEDEP}] )
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	esetup.py test || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( doc/_build/html/. )

	distutils-r1_python_install_all
}
