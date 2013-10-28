# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils git-2 distutils-r1

EGIT_REPO_URI="git://github.com/alunduil/singularity.git"

DESCRIPTION="Openstack Guest Agent"
HOMEPAGE="http://www.alunduil.com/projects/singularity"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="selinux xen"

DEPEND=""
RDEPEND="
	${DEPEND}
	!app-emulation/openstack-guest-agents
	dev-python/python-daemon
	dev-python/pycrypto
	sys-apps/net-tools
	sys-apps/iproute2
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
