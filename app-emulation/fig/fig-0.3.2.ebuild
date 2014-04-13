# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Punctual, lightweight development environments using Docker"
HOMEPAGE="http://orchardup.github.io/fig/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="
	${DEPEND}
	~dev-python/docopt-0.6.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	~dev-python/requests-2.2.1[${PYTHON_USEDEP}]
	~dev-python/texttable-0.8.1[${PYTHON_USEDEP}]
	~dev-python/websocket-client-0.11.0[${PYTHON_USEDEP}]
	"
