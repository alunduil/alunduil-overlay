# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )
DISUTILS_IN_SOURCE_BUILD=true

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Python LiveReload is an awesome tool for web developers"
HOMEPAGE="https://github.com/lepture/python-livereload"
SRC_URI="https://github.com/lepture/python-${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"

RDEPEND="www-servers/tornado[${PYTHON_USEDEP}]"

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
