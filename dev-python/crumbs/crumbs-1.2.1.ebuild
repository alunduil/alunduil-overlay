# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_2 python3_3 )

inherit distutils-r1

DESCRIPTION="Generalized all-in-one parameters module"
HOMEPAGE="https://github.com/alunduil/crumbs"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="inotify test"

REQUIRED_USE="${PTYHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${PYTHON_DEPS}
	inotify? ( dev-python/pyinotify[${PYTHON_USEDEP}] )
"

python_test() {
	flake8 || die 'flake8'
	nosetests || die 'nosetests'
}
