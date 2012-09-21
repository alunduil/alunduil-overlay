# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Rackspace Cloud Backup Client"
HOMEPAGE="http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-install-the-agent"
SRC_URI="http://agentrepo.drivesrvr.com/tar/driveclient-${PV}.tar.bz2"
S="${WORKDIR}/driveclient-${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	keepdir /etc/driveclient
	insinto /etc/driveclient
	doins cacert.pem

	newinitd "${FILESDIR}"/init.rackspace-driveclient ${PN}

	insinto /opt/${PN}/bin
	exeinto /opt/${PN}/bin
	doexe driveclient
}

pkg_postinst() {
	elog "If this is the first time you've installed rackspace-driveclient you"
	elog "may want to run the configure:"
	elog "emerge --config \=${P}."
}

pkg_config() {
	/opt/${PN}/bin/driveclient --configure
}
