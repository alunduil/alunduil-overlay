# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python library to use the pseudo-tty of a docker container"
HOMEPAGE="https://github.com/d11wtq/dockerpty"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		app-emulation/docker
		>=dev-python/behave-1.2.4[${PYTHON_USEDEP}]
		>=dev-python/docker-py-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/expects-0.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.5.2[${PYTHON_USEDEP}]
	)
"
RDEPEND=">=dev-python/docker-py-0.3.2[${PYTHON_USEDEP}]"

python_test() {
	ewarn "${PN} tests require a running docker service!"
	ebegin "checking that docker is running"
	docker info
	DOCKER_FOUND=$?
	eend ${DOCKER_FOUND}

	[[ ${DOCKER_FOUND} -eq 0 ]] && behave || die "Feature tests failed under ${EPYTHON}"

	py.test tests || die "Tests failed under ${EPYTHON}"
}
