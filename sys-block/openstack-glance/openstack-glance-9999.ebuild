# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3*"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/glance.git"

DESCRIPTION="The Glance project provides services for discovering, registering,
and retrieving virtual machine images."
HOMEPAGE="https://launchpad.net/glance"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="+sqlite mysql postgres test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/eventlet
	dev-python/greenlet
	dev-python/sqlalchemy-migrate
	dev-python/pastedeploy
	sqlite? ( dev-python/sqlalchemy[sqlite] )
	mysql? ( dev-python/sqlalchemy[mysql] )
	postgres? ( dev-python/sqlalchemy[postgres] )
	( || (
		sys-block/openstack-glance[sqlite]
		sys-block/openstack-glance[mysql]
		sys-block/openstack-glance[postgres]
		) )
	"

src_install() {
	distutils_src_install

	newinitd "${FILESDIR}/glance.initd" glance

	keepdir /etc/glance
	insinto /etc/glance

	newins "etc/glance-api.conf" "glance-api.conf"
	newins "etc/glance-api-paste.ini" "glance-api-paste.ini"
	newins "etc/glance-registry.conf" "glance-registry.conf"
	newins "etc/glance-registry-paste.ini" "glance-registry-paste.ini"

	if ! use test; then
		find "${D}" -iname "*test*" -exec rm -rf "{}" \;
	fi
}
