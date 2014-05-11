# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="Logentries agent"
HOMEPAGE="https://logentries.com/"
SRC_URI="https://github.com/logentries/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~mips ~ppc ~ppc-macos ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	|| (
		dev-lang/python:2.6
		dev-lang/python:2.7
	)
	dev-python/simplejson
	app-crypt/gnupg
"

src_install() {
	dobin le
	dosym le /usr/bin/le-monitor

	keepdir /etc/le
	insinto /etc/le
	doins ca-certs.pem

	doinitd "${FILESDIR}/le-monitor"
}

pkg_postinst() {
	einfo "To use ${PN} to monitor your system, add le-monitor to your default runlevel: \`rc-update add le-monitor default\`."
	ewarn "You must register ${PN} by running \`le register\` before it can be used."
}
