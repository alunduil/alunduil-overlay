# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flake8/flake8-2.0.ebuild,v 1.11 2014/08/20 20:30:48 blueness Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="the modular source code checker: pep8, pyflakes and co"
HOMEPAGE="http://bitbucket.org/tarek/flake8"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~x86"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"
RDEPEND="
	>=dev-python/pyflakes-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/pep8-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/mccabe-0.2[${PYTHON_USEDEP}]
"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	esetup.py test || die "Tests failed for ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )

	distutils-r1_python_install_all
}
