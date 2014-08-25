# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=TRUE

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Fast, isolated development environments using Docker"
HOMEPAGE="http://orchardup.github.io/fig/"
SRC_URI="https://github.com/orchardup/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

CDEPEND="
	~dev-python/dockerpty-0.2.3[${PYTHON_USEDEP}]
	~dev-python/docopt-0.6.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	~dev-python/requests-2.2.1[${PYTHON_USEDEP}]
	~dev-python/texttable-0.8.1[${PYTHON_USEDEP}]
	~dev-python/websocket-client-0.11.0[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		~dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		~dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
	)
	${CDEPEND}
"
RDEPEND="${CDEPEND}"

python_prepare_all() {
	ebegin 'patching setup.py'
	sed \
		-e 's/packages=find_packages(/&exclude=["tests.*", "tests"]/' \
		-i setup.py || die 'sed'
	eend $?

	distutils-r1_python_prepare_all
}

python_test() {
	flake8 fig || die 'flake8'
	nosetests tests/unit || die 'nosetests'
}
