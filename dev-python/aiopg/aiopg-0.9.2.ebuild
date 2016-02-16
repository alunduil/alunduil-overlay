# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_4 python3_5 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Postgres integration with asyncio."
HOMEPAGE="http://aiopg.readthedocs.org"
SRC_URI="https://github.com/aio-libs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples test"

CDEPEND=">=dev-python/psycopg-2.5.2[${PYTHON_USEDEP}]"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"
RDEPEND="
	${CDEPEND}
	>=dev-python/sqlalchemy-0.9[${PYTHON_USEDEP}]
"

python_compile_all() {
	use doc  && emake -C docs html
}

python_test() {
	py.test -q tests || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
