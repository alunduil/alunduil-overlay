# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/hacking/hacking-0.8.1.ebuild,v 1.1 2014/04/19 02:30:43 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )
DISTUTILS_IN_SOURCE_BUILD=TRUE

inherit distutils-r1

DESCRIPTION="OpenStack Hacking Guideline Enforcement"
HOMEPAGE="https://github.com/openstack-dev/hacking"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux ~x86 ~x86-linux"
IUSE="doc test"

CDEPEND="
	>=dev-python/d2to1-0.2.10[${PYTHON_USEDEP}]
	<dev-python/d2to1-0.3[${PYTHON_USEDEP}]
	>=dev-python/pbr-0.5.10[${PYTHON_USEDEP}]
	<dev-python/pbr-0.6[${PYTHON_USEDEP}]
"
CRDEPEND="
	~dev-python/flake8-2.0[${PYTHON_USEDEP}]
	~dev-python/pep8-1.4.5[${PYTHON_USEDEP}]
	~dev-python/pyflakes-0.7.2[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${CDEPEND}
	test? (
		${CRDEPEND}
		>=dev-python/coverage-3.6[${PYTHON_USEDEP}]
		dev-python/discover[${PYTHON_USEDEP}]
		>=dev-python/fixtures-0.3.12[${PYTHON_USEDEP}]
		>=dev-python/sphinx-1.1.2[${PYTHON_USEDEP}]
		dev-python/subunit[${PYTHON_USEDEP}]
		>=dev-python/testrepository-0.0.13[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
		>=dev-python/testtools-0.9.27[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${CDEPEND}
	${CRDEPEND}
"

python_prepare_all() {
	ebegin 'patching doc/source/conf.py'
	sed \
		-e '/intersphinx_mapping/d' \
		-i doc/source/conf.py || die 'sed'
	eend $?

	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && sphinx-build -b html -c doc/source/ doc/source/ doc/source/html
}

python_test() {
	esetup.py testr || die "Tests failed for ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/source/html/. )

	distutils-r1_python_install_all
}
