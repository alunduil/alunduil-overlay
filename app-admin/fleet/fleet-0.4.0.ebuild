# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A Distributed init System"
HOMEPAGE="https://github.com/coreos/fleet"
SRC_URI="https://github.com/coreos/fleet/archive/v0.4.0.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"

RESTRICT="strip"

src_compile() {
	./build || die
}

src_install() {
	dobin bin/fleet
	dobin bin/fleetctl
}
