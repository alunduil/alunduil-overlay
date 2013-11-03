# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils git-2

EGIT_REPO_URI="https://github.com/rackerlabs/openstack-guest-agents-unix.git"

DESCRIPTION="Openstack Unix Guest Agent"
HOMEPAGE="https://github.com/rackerlabs/openstack-guest-agents-unix"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-util/patchelf
	dev-python/pyxenstore
	"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	doinitd scripts/gentoo/nova-agent || die "doinitd failed"
}
