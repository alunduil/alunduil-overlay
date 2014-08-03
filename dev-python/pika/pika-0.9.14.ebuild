# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Pika Python AMQP Client Library"
HOMEPAGE="https://pika.readthedocs.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples libev test tornado twisted"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	doc? (
		dev-python/pyev[${PYTHON_USEDEP}]
		dev-python/twisted-core[${PYTHON_USEDEP}]
		www-servers/tornado[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/twisted-core[${PYTHON_USEDEP}]
		www-servers/tornado[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	libev? ( dev-python/pyev[${PYTHON_USEDEP}] )
	tornado? ( www-servers/tornado[${PYTHON_USEDEP}] )
	twisted? ( dev-python/twisted-core[${PYTHON_USEDEP}] )
"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	nosetests -c nose.cfg || die 'nosetests'
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
