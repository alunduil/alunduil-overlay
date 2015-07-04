# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit systemd vcs-snapshot

DESCRIPTION="rkt is an App Container runtime for Linux"
HOMEPAGE="https://github.com/coreos/rkt"
SRC_URI="https://github.com/coreos/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	>=dev-lang/go-1.3
	test? ( dev-go/go-tools )
"
RDEPEND=""

src_compile() {
	local RKT_STAGE1_USR_FROM=none
	./build || die "build failed"
}

src_test() {
	./test || die "tests failed"
}

src_install() {
	dobin "${S}"/bin/rkt

	systemd_dounit dist/init/systemd/rkt-gc.service
	systemd_dounit dist/init/systemd/rkt-gc.timer
	systemd_dounit dist/init/systemd/rkt-metadata.service
	systemd_dounit dist/init/systemd/rkt-metadata.socket

	dodoc README.md
}
