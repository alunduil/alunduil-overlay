# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/pidgin-knotify/pidgin-knotify-0.2.1.ebuild,v 1.2 2010/04/12 19:03:11 maekke Exp $

EAPI="2"

inherit eutils

DESCRIPTION="Plugin that enables knotify for Pidgin in KDE 4 environment"
HOMEPAGE="http://code.google.com/p/pidgin-knotify/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-im/pidgin
	kde-base/knotify"
RDEPEND="${DEPEND}"

src_unpack() {
	epatch "${FILESDIR}"/security-336916.patch || die "Could not apply patch!"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
