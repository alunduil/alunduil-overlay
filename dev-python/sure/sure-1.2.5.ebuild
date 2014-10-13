# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="utility belt for automated testing in python for python"
HOMEPAGE="http://github.com/gabrielfalcao/sure"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

CDEPEND="
	~dev-python/nose-1.3.0[${PYTHON_USEDEP}]
	~dev-python/rednose-0.4.1[${PYTHON_USEDEP}]
"
DEPEND="test? ( ${CDEPEND} )"
RDEPEND="${CDEPEND}"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/setup-unicode.patch
	)

	distutils-r1_python_prepare_all
}

python_test() {
	nosetests -s tests --rednose || die "Tests failed under ${EPYTHON}"
}
