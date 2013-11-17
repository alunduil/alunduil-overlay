# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils vcs-snapshot

DESCRIPTION="Openstack Unix Guest Agent"
HOMEPAGE="http://github.com/rackerlabs/openstack-guest-agents-unix"
SRC_URI="https://github.com/rackerlabs/${PN}-unix/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-util/patchelf
	dev-python/pyxenstore
	"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/gentoo-network-restart.patch"

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install

	doinitd scripts/gentoo/nova-agent
}
