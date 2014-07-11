# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 systemd

EGIT_REPO_URI="git://github.com/coreos/fleet.git"

DESCRIPTION="A Distributed init System"
HOMEPAGE="https://github.com/coreos/fleet"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/go-1.2"
RDEPEND=""

src_compile() {
	./build || die
}

src_install() {
	dobin "${S}"/bin/fleet
	dobin "${S}"/bin/fleetctl

	systemd_dounit "${FILESDIR}"/${PN}.service
}
