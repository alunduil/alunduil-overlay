# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools

EGIT_REPO_URI="git://git.carnivore.it/dionaea.git"

DESCRIPTION="Dionaea is meant to be a nepenthes successor, embedding python as
scripting language, using libemu to detect shellcodes, supporting ipv6 and tls"
HOMEPAGE="http://dionaea.carnivore.it/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	net-libs/liblcfg
	"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
