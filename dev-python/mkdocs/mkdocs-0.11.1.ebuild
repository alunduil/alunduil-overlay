# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Project documentation with Markdown."
HOMEPAGE="http://www.mkdocs.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"

#<dev-python/markdown-2.5[${PYTHON_USEDEP}]
RDEPEND="
	>=dev-python/jinja-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/watchdog-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/ghp-import-0.4.1[${PYTHON_USEDEP}]
"

python_compile_all() {
	use doc && ${PYTHON} -m mkdocs.main
}

python_test() {
	nosetests mkdocs/test.py || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( site/. )

	distutils-r1_python_install_all
}
