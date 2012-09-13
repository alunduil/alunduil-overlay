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
IUSE="xen"

DEPEND=""
RDEPEND="${DEPEND}
	!app-emulation/openstack-guest-agents
	dev-python/python-daemon
	dev-python/pycrypto
	sys-apps/net-tools
	sys-apps/iproute2
	sys-apps/shadow
	xen? ( app-emulation/xen-tools )
	"

src_install() {
	distutils_src_install

	keepdir /etc/singularity
	insinto /etc/singularity
	newins config/singularity.conf singularity.conf || die "Failed newins"

	newinitd config/init.gentoo singularity || die "Failed newinitd"

	dodir "/var/cache/singularity" || die "Failed dodir"
	dodir "/var/run/singularity" || die "Failed dodir"
}
