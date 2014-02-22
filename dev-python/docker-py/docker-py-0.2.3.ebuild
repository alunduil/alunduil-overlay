# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="An API client for docker written in Python"
HOMEPAGE="https://github.com/dotcloud/docker-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	${PYTHON_DEPS}
	~dev-python/mock-1.0.1[${PYTHON_USEDEP}]
	~dev-python/requests-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.3.0[${PYTHON_USEDEP}]
	~dev-python/websocket-client-0.11.0[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
