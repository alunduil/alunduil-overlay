# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_2 python3_3 )
DISTUTILS_SINGLE_IMPL=TRUE

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Alternative Openstack Guest Agent"
HOMEPAGE="https://github.com/alunduil/singularity"
SRC_URI="https://github.com/alunduil/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xen"

DEPEND=""
RDEPEND="
	!app-emulation/openstack-guest-agents-unix
	dev-python/pycrypto
	dev-python/python-daemon
	sys-apps/iproute2
	sys-apps/net-tools
	sys-apps/shadow
	xen? ( app-emulation/xen-tools )
"

python_install_all() {
	distutils-r1_python_install_all

	keepdir /etc/singularity

	insinto /etc/singularity
	doins config/singularity.conf

	newinitd config/init.gentoo singularity
}
