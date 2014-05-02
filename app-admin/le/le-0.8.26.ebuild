# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2
DESCRIPTION="Command line utility for a convenient access to the logentries.com logging infrastructure."
HOMEPAGE="https://logentries.com/"

AUTHOR=logentries

SRC_URI="https://github.com/logentries/le/tarball/v${PV} -> $P.tar.gz"
S="${WORKDIR}/logentries-${PN}-*"
KEYWORDS="~amd64 -ia64 ~mips ~ppc ~ppc-macos ~x86"
DEPEND="
	dev-lang/python
	dev-python/simplejson
	app-crypt/gnupg
	"
RDEPEND=""
LICENSE="GPL-2"
SLOT="0"

src_unpack() {
	unpack  ${A}
}

src_install() {
	doinitd "/usr/portage/local/app-admin/le/logentries"
	cd "${S}"
	emake DESTDIR="${D}" install || die "Install failed"
}
