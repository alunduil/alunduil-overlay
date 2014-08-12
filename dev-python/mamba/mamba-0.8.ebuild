# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 pypy )

inherit distutils-r1

DESCRIPTION="The definitive testing tool for Python. Born under the banner of Behavior Driven Development"
HOMEPAGE="http://nestorsalceda.github.io/mamba"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	test? (
		~dev-python/expects-0.2.1[${PYTHON_USEDEP}]
		~dev-python/doublex-1.8.1[${PYTHON_USEDEP}]
		~dev-python/PyHamcrest-1.8.0[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${PYTHON_DEPS}
	~dev-python/clint-0.3.1[${PYTHON_USEDEP}]
	~dev-python/coverage-3.7[${PYTHON_USEDEP}]
	~dev-python/watchdog-0.6.0[${PYTHON_USEDEP}]
"

python_test() {
	mamba || die 'mamba'
}
