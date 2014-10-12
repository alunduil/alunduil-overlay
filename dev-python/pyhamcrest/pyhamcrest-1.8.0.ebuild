# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 pypy )

inherit distutils-r1 vcs-snapshot

MY_PN="PyHamcrest"

DESCRIPTION="Hamcrest framework for matcher objects"
HOMEPAGE="https://github.com/hamcrest/PyHamcrest"
SRC_URI="https://github.com/hamcrest/${MY_PN}/archive/V${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"

S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples numpy test"

CDEPEND="$(python_gen_cond_dep 'numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )' 'python*')"
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		${CDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)
"
RDEPEND="${CDEPEND}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	if [[ "${EPYTHON}" = "python2.7" ]]; then
		ebegin 'patching tests/hamcrest_unit_test/text/stringcontains_test.py'
		sed \
			-e "63s/'EXCERPT'/u&/" \
			-i tests/hamcrest_unit_test/text/stringcontains_test.py
		STATUS=$?
		eend ${STATUS}
		[[ ${STATUS} -gt 0 ]] && die
	fi

	py.test -v || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}
