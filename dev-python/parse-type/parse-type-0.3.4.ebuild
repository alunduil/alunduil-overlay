# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="Simplifies to build parse types based on the parse module"
HOMEPAGE="https://github.com/jenisys/parse_type"

MY_PN="${PN/-/_}"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-1.1[${PYTHON_USEDEP}] )
	test? ( 
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/parse-1.6[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/enum34[${PYTHON_USEDEP}]' 'python2* python3_3')
"

python_prepare_all() {
	esetup.py build_sphinx || "Building documentation failed under ${PYTHON}"
}

python_test() {
	esetup.py test || "Tests failed under ${EPYTHON}"
}

python_install_all() {
	local HTML_DOCS=( build/docs/html/. )

	distutils-r1_python_install_all
}
