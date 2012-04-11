# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/keystone.git"

DESCRIPTION="Identity Service for Openstack"
HOMEPAGE="https://launchpad.net/keystone"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/greenlet
	dev-python/pastedeploy
	dev-python/eventlet
	dev-python/routes
	"

src_install() {
	distutils_src_install

	newinitd "${FILESDIR}/keystone.initd" keystone

	keepdir /etc/keystone
	insinto /etc/keystone

	newins "etc/keystone.conf" "keystone.conf"
	newins "etc/logging.conf.sample" "logging.conf"
}
