# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-termstyle/python-termstyle-0.1.10.ebuild,v 1.2 2014/10/15 01:32:03 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python{3_3,3_4} pypy )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="console colouring for python"
HOMEPAGE="http://gfxmonk.net/dist/0install/python-termstyle.xml"
SRC_URI="https://github.com/gfxmonk/${PN#*-}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/tests-unicode.patch
	)

	distutils-r1_python_prepare_all
}

python_test() {
	if [[ "${LC_ALL}" = "C" ]]; then
		ewarn "skipping tests due to:"
		ewarn "LC_ALL=C"
		ewarn "tests require a UTF locale (i.e. en_US.utf8)"
	else
		if [[ "${EPYTHON}" = "python2.7" ]]; then
			"${PYTHON}" test2.py || die "test2.py failed under ${EPYTHON}"
		else
			"${PYTHON}" test3.py || die "test3.py failed under ${EPYTHON}"
		fi
	fi
}