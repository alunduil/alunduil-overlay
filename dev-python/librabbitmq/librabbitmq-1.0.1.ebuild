# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_{5,6,7} )

inherit distutils-r1

DESCRIPTION="AMQP Client using the rabbitmq-c library."
HOMEPAGE="python2_://github.com/celery/librabbitmq"
SRC_URI="https://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-misc/rabbitmq-c"
RDEPEND="${DEPEND}"
