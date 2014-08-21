# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/fleet/fleet-9999.ebuild,v 1.1 2014/07/19 19:43:53 alunduil Exp $

EAPI=5

inherit git-2 systemd

EGIT_REPO_URI="git://github.com/coreos/fleet.git"

DESCRIPTION="A Distributed init System"
HOMEPAGE="https://github.com/coreos/fleet"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="doc examples"

DEPEND=">=dev-lang/go-1.2"
RDEPEND=""

src_compile() {
	./build || die 'build'
}

src_test() {
	./test || die 'test'
}

src_install() {
	dobin "${S}"/bin/fleet
	dobin "${S}"/bin/fleetctl

	dodoc README.md

	use doc && dodoc Documentation/*

	if use examples; then
		docinto /usr/share/doc/${PF}/examples
		dodoc fleet.conf.sample
		dodoc examples/*
	fi

	systemd_dounit "${FILESDIR}"/"${PN}".service
}
