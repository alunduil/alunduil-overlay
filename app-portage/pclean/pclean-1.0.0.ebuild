# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_3 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Portage configuration file lint utility."
HOMEPAGE="https://github.com/alunduil/pclean"
SRC_URI="https://github.com/alunduil/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
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
