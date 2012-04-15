# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils

EGIT_REPO_URI="https://github.com/jbittel/httpry.git"

DESCRIPTION="HTTP logging and information retrieval tool"
HOMEPAGE="http://dumpsterventures.com/jason/httpry/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/makefile-add-prefix.patch"
}

src_install() {
	emake PREFIX="${D}/usr" install || die "Install failed"
}
