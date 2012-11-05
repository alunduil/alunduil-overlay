# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit distutils eutils vcs-snapshot

DESCRIPTION="Openstack Guest Agent"
HOMEPAGE="http://www.alunduil.com/projects/singularity"
SRC_URI="https://github.com/alunduil/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="selinux xen"

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	!app-emulation/openstack-guest-agents
	dev-python/python-daemon
	dev-python/pycrypto
	sys-apps/net-tools
	sys-apps/iproute2
	sys-apps/shadow
	xen? ( app-emulation/xen-tools )
	selinux? ( sec-policy/selinux-openstack-guest-agent )
	"

src_install() {
	distutils_src_install

	keepdir /etc/singularity
	insinto /etc/singularity
	newins config/singularity.conf singularity.conf

	newinitd config/init.gentoo singularity

	dodir "/var/cache/singularity"
	dodir "/var/run/singularity"
}
