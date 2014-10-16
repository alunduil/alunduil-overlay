# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="Expressive and extensible TDD/BDD assertion library for Python"
HOMEPAGE="https://github.com/jaimegildesagredo/expects"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( ~dev-python/mamba-0.6[${PYTHON_USEDEP}] )
"
RDEPEND=""

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	mamba || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( build/docs/html/. )

	distutils-r1_python_install_all
}
