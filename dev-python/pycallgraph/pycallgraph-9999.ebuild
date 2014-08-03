# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/gak/pycallgraph.git"

DESCRIPTION="library and command line tool to visualise the flow of Python applications"
HOMEPAGE="http://pycallgraph.slowchop.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc examples test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
RDEPEND="${PYTHON_DEPS}"

python_compile_all() {
	if use examples; then
		cd docs/examples
		./generate.py || die 'generate examples'
		cd -

		cd docs/guide/filtering
		./generate.py || die 'generate filtering examples'
		cd -
	fi

	use doc && emake -C docs html

	emake -C docs man
}

python_test() {
	py.test --pep8 --ignore=pycallgraph/memory_profiler.py test pycallgraph examples || die 'pytest'

	flake8 --exclude=__init__.py,memory_profiler.py pycallgraph || die 'flake8 pycallgraph'
	flake8 --ignore=F403 test || die 'flake8 test'
	flake8 examples || die 'flake8 examples'
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all

	doman docs/_build/man/pycallgraph.1
}

pkg_postinst() {
	elog "${PN} requires one of these viewers:"
	elog " * graphviz: media-gfx/graphviz (recommended)"
	elog " * gephi: not yet in portage"
}
