# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 python3_3 )

inherit distutils-r1

DESCRIPTION="AMQP Messaging Framework for Python"
HOMEPAGE="http://kombu.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="msgpack yaml redis mongodb sqs couchdb beanstalk zookeeper zeromq sqlalchemy pyro"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	>=dev-python/anyjson-0.3.3[${PYTHON_USEDEP}]
	>=dev-python/py-amqp-1.4.4[${PYTHON_USEDEP}]
	<dev-python/py-amqp-2[${PYTHON_USEDEP}]

	msgpack? ( >=dev-python/msgpack-0.3.0[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-py-2.8.0[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-2.6.2[${PYTHON_USEDEP}] )
	sqs? ( >=dev-python/boto-2.13.3 )
	couchdb? ( dev-python/couchdb-python )
	beanstalk? ( dev-python/beanstalkc )
	zookeeper? ( >=dev-python/kazoo-1.3.1[${PYTHON_USEDEP}] )
	zeromq? ( >=dev-python/pyzmq-13.1.0[${PYTHON_USEDEP}] )
	sqlalchemy? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	pyro? ( dev-python/pyro:4[${PYTHON_USEDEP}] )
	"
RDEPEND="${DEPEND}"
