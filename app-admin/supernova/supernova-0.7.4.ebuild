# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1

DESCRIPTION="Use novaclient with multiple OpenStack nova environments the easy way"
HOMEPAGE="https://github.com/major/supernova"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="
	>dev-python/keyring-0.9.2[${PYTHON_USEDEP}]
	<dev-python/keyring-2[${PYTHON_USEDEP}]
	"
DEPEND="
	${COMMON_DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
RDEPEND="
	${COMMON_DEPEND}
	dev-python/python-novaclient
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	"
