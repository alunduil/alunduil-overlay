# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_3 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/alunduil/pclean.git"

DESCRIPTION="Portage configuration file lint utility."
HOMEPAGE="https://github.com/alunduil/pclean"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		)
	"
RDEPEND=""

python_test() {
	nosetests || die
}
