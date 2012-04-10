# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3* *-jython"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/nova.git"

DESCRIPTION="OpenStack Compute (Nova)"
HOMEPAGE="https://launchpad.net/nova"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="sqlite mysql postgres kvm lxc qemu xen"

DEPEND=""
RDEPEND="${DEPEND}
	net-misc/ntp
	sqlite? ( dev-db/sqlite )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )
	kvm? ( app-emulation/qemu-kvm )
	lxc? ( app-emulation/lxc )
	qemu? ( app-emulation/qemu )
	xen? ( app-emulation/xen )"

pkg_setup() {
	enewgroup nova
}

src_install() {
	distutils_src_install

	keepdir /etc/nova
	insinto /etc/nova

	newins ${W}/etc/nova/nova.conf.sample nova.conf

	fowners root:nova "${D}/etc/nova/nova.conf" || die "fowners failed"
	fperms 640 "${D}/etc/nova/nova.conf" || die "fperms failed"
}

pkg_postinst() {
	elog "The following parameters must be configured correctly in"
	elog "/etc/nova/nova.conf:"
	elog "  * sql_connection ::"
	elog "      SQL Alchemy connect string (reference); location of the"
	elog "      openstack compute SQL database."
	elog "  * s3_host ::"
	elog "      IP address of the host where openstack compute is hosting the"
	elog "      object store service which will contain the virtual machine"
	elog "      images and buckets"
	elog "  * rabbit_host ::"
	elog "      IP address of the RabbitMQ server"
	elog "  * verbose ::"
	elog "      Set to 1 to turn on verbose output (helpful during initial"
	elog "      setup)"
	elog "  * network_manager ::"
	elog "      Configures how your controller will communicate with additional"
	elog "      openstack compute nodes and virtual machines.  The choices are:"
	elog "        * nova.network.manager.FlatManager - Non-VLAN Networking"
	elog "        * nova.network.manager.FlatDHCPManager - Flat with DHCP"
	elog "        * nova.network.manager.VlanManager - VLAN with DHCP (Default)"
	elog "  * fixed_range ::"
	elog "      CIDR address of the network that all projects for future VM"
	elog "      guests reside on (e.g. 192.168.0.0./12)"
	elog "  * ec2_host ::"
	elog "      IP address of the nova-api service"
	elog "  * ec2_url ::"
	elog "      URL of the EC2 service"
	elog "  * osapi_host ::"
	elog "      IP address of the nova-api service"
	elog "  * network_size ::"
	elog "      Number of addresses in each private subnet"
	elog "  * glance_api_servers ::"
	elog "      IP and port for the image service"
	elog "  * use_deprecated_auth ::"
	elog "      If this flag is present, the cactus method of authentication is"
	elog "      used with the novarc file containing credentials"
	elog ""
	elog "After configuring the above parameters you might want to run:"
	elog "\"emerge --config =${CATEGORY}/${PF}\""
}

pkg_config() {
	"${ROOT}"/usr/bin/nova-manage db sync
}
