# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils distutils-r1 vcs-snapshot

DESCRIPTION="Openstack Guest Agent"
HOMEPAGE="https://github.com/alunduil/singularity"
SRC_URI="https://github.com/alunduil/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="selinux xen"

DEPEND=""
RDEPEND="
	${DEPEND}
	!app-emulation/openstack-guest-agents
	dev-python/pycrypto
	dev-python/python-daemon
	sys-apps/iproute2
	sys-apps/net-tools
	sys-apps/shadow
	xen? ( app-emulation/xen-tools )
	selinux? ( sec-policy/selinux-openstack-guest-agent )
	"

python_install() {
	distutils-r1_python_install

	keepdir /etc/singularity
	insinto /etc/singularity
	newins config/singularity.conf singularity.conf

	newinitd config/init.gentoo singularity

	dodir "/var/cache/singularity"
	dodir "/var/run/singularity"
}
