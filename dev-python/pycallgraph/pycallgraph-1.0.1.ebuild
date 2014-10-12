# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="library and command line tool to visualise the flow of Python applications"
HOMEPAGE="http://pycallgraph.slowchop.com/"
SRC_URI="https://github.com/gak/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		media-gfx/graphviz
	)
"
RDEPEND=""

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/python3.3-tests.patch
	)

	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use examples; then
		cd docs/examples
		"${PYTHON}" generate.py || die "Couldn't generate examples"
		cd -

		cd docs/guide/filtering
		"${PYTHON}" generate.py || die "Couldn't generate filtering examples"
		cd -
	fi

	use doc && emake -C docs html

	emake -C docs man
}

python_test() {
	# gephi is not in portage; thus, skip the gephi tests
	rm test/test_gephi.py

	py.test --ignore=pycallgraph/memory_profiler.py test pycallgraph examples || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all

	doman docs/_build/man/pycallgraph.1
}

pkg_postinst() {
	elog "${PN} requires one of these viewers:"
	elog "  media-gfx/graphviz (recommended)"
	elog "  gephi: not yet in portage"
}
