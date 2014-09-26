# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/oslo-sphinx/oslo-sphinx-2.2.0.ebuild,v 1.1 2014/09/22 21:24:06 prometheanfire Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="OpenStack Sphinx Extensions"
HOMEPAGE="http://www.openstack.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN//-/}/${PN//-/}-${PV}.tar.gz"
S="${WORKDIR}/oslosphinx-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# NOTE: dev-python/hacking is unecessary as there are no tests

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/pbr[${PYTHON_USEDEP}]
"
RDEPEND=""
