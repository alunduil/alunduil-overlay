# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Pika Python AMQP Client Library"
HOMEPAGE="https://github.com/pika"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-1.1 GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND="
	doc? (
		dev-python/twisted-core
		www-servers/tornado
		)
	"
DEPEND="
	${RDEPEND}
	test? (
		dev-python/nose
		dev-python/mock
		dev-python/pyyaml
		)
	"
