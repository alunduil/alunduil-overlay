# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyflakes/pyflakes-0.7.2.ebuild,v 1.7 2013/12/15 15:09:01 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="passive checker of Python programs"
HOMEPAGE="https://launchpad.net/pyflakes http://pypi.python.org/pypi/pyflakes"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux ~arm-linux ~ppc ~ppc64 ~x86 ~x86-linux ~x86-macos"
IUSE="test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/unittest2[${PYTHON_USEDEP}] )
"
RDEPEND=""

python_prepare_all() {
	# a known failure of 1 test in py3.2.4
	# https://bugs.launchpad.net/pyflakes/+bug/1172463
	# remove this known failure for this version
	ebegin 'patching pyflakes/test/test_api.py'
	sed \
		-e '/def test_invalidEscape(self):/,/def/ d' \
		-i pyflakes/test/test_api.py || die 'sed'
	eend $?

	distutils-r1_python_prepare_all
}

python_test() {
	esetup.py test --quiet
}
