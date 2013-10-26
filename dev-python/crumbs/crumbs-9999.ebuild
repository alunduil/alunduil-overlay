# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_2 python3_3 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/alunduil/upkern.git"

DESCRIPTION="Generalized all-in-one parameters module"
HOMEPAGE="https://github.com/alunduil/crumbs"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

DEPEND="
	test? (
		dev-python/nose[coverage]
		dev-python/mock
		)
	"
RDEPEND="
	virtual/python-argparse
	"

python_test() {
	nosetests || die
}
