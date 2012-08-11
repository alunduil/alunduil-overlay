# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils autotools

EGIT_REPO_URI="git://github.com/rackspace/openstack-guest-agents-unix.git"

DESCRIPTION="Openstack Unix Guest Agent"
HOMEPAGE="https://github.com/rackspace/openstack-guest-agents-unix"
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
	epatch "${FILESDIR}"/gentoo_init.patch || die "epatch failed"
	epatch "${FILESDIR}"/gentoo_networking.patch || die "epatch failed"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	doinitd scripts/gentoo/nova-agent || die "doinitd failed"
}
