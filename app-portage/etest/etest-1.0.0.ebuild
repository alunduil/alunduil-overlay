# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python3_3 python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="ebuild testing framework"
HOMEPAGE="https://github.com/alunduil/etest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${CDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/docker-py[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
"

python_test() {
	nosetests test_etest/test_unit || die "Tests failed under ${EPYTHON}"
}

pkg_postinst() {
	[[ "${LANG}" = *.utf8 ]] || ewarn "etest requires a utf8 locale to run"

	elog "etest uses docker to run isolated test environments."
	elog "etest does _not_ explicitly depend on docker."
	elog "If you want to use a local docker instance; please, ensure that it has been"
	elog "installed and started."
}
