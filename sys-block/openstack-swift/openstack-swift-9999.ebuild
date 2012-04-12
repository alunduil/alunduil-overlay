# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit eutils git-2 distutils linux-info

EGIT_REPO_URI="https://github.com/openstack/swift.git"

DESCRIPTION="OpenStack Object Storage (Swift)"
HOMEPAGE="https://launchpad.net/swift"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="proxy account container object"

DEPEND=""
RDEPEND="${DEPEND}"

CONFIG_CHECK="~EXT3_FS_XATTR ~SQUASHFS_XATTR ~CIFS_XATTR ~JFFS2_FS_XATTR
~TMPFS_XATTR ~UBIFS_FS_XATTR ~EXT2_FS_XATTR ~REISERFS_FS_XATTR ~EXT4_FS_XATTR"

pkg_setup() {
	python_pkg_setup
	enewuser swift
	enewgroup swift
}

src_install() {
	distutils_src_install

	keepdir /etc/swift
	insinto /etc/swift
	
	newins "etc/swift.conf-sample" "swift.conf"

	if use proxy; then
		newinitd "${FILESDIR}/swift-proxy.initd" swift-proxy

		newins "etc/proxy-server.conf-sample" "proxy-server.conf"
	fi

	fowners swift:swift "/etc/swift" || die "fowners failed"
}

pkg_postinst() {
	elog "Openstack swift will default to using insecure http unless a"
	elog "certificate is created in /etc/swift/cert.crt and the associated key"
	elog "in /etc/swift/cert.key.  These can be created with the following:"
	elog "  * cd /etc/swift"
	elog "  * openssl req -new -x509 -nodes -out cert.crt -keyout cert.key"

	if use proxy; then
		elog ""
		elog "The storage rings must be created with the following three"
		elog "commands:"
		elog "  * cd /etc/swift"
		elog "  * swift-ring-builder account.builder create SIZE REPLICAS HOURS"
		elog "  * swift-ring-builder container.builder create SIZE REPLICAS HOURS"
		elog "  * swift-ring-builder object.builder create SIZE REPLICAS HOURS"
		elog ""
		elog "The ring building commands take three arguments: SIZE, REPLICAS,"
		elog "HOURS.  Where SIZE is used to determine the total storage you"
		elog "expect your swift cluster to use (e.g. 2^SIZE); REPLICAS is the"
		elog "number of replicas to keep in the cluster of any piece of data;"
		elog "and HOURS is the number of hours to restrict moving a partition"
		elog "more than once."
		elog ""
		elog "Add zones to the rings with the following commands:"
		elog "  * swift-ring-builder account.builder add zZONE-IP:6002/DEV WEIGHT"
		elog "  * swift-ring-builder container.builder add zZONE-IP:6001/DEV WEIGHT"
		elog "  * swift-ring-builder object.builder add zZONE-IP:6000/DEV WEIGHT"
		elog ""
		elog "The zone parameters (ZONE, IP, DEV, and WEIGHT) dictate how the"
		elog "zone is utilized in the cluster.  ZONE is a unique number for the"
		elog "zone being created.  Every grouping of three commands run must"
		elog "increment ZONE.  IP is the IP of this proxy node.  DEV is the"
		elog "device to use for storage (e.g. sdb1, sda4, etc).  WEIGHT is the"
		elog "preference to utilize this device over others.  Higher numbers"
		elog "are higher preference and should be reserved for bigger or faster"
		elog "disks."
		elog ""
		elog "Once this has all been done, the rings must be rebalanced:"
		elog "  * swift-ring-builder account.builder rebalance"
		elog "  * swift-ring-builder container.builder rebalance"
		elog "  * swift-ring-builder object.builder rebalance"
		elog ""
		elog "Copy the account.ring.gz, container.ring.gz, and object.ring.gz"
		elog "files to all the proxy and swift nodes"
	fi
}
