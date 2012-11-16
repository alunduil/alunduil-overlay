# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools

EGIT_REPO_URI="git://git.carnivore.it/dionaea.git"

DESCRIPTION="nepenthes successor"
HOMEPAGE="http://dionaea.carnivore.it/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="ev emu cspm udns gc ssl pcap netfilter_queue xmatch cython lcfg curl"

DEPEND="
	lcfg? ( net-libs/liblcfg )
	"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable ev) \
		$(use_enable emu) \
		$(use_enable cspm) \
		$(use_enable udns) \
		$(use_enable gc) \
		$(use_enable ssl) \
		$(use_enable pcap) \
		$(use_enable netfilter_queue) \
		$(use_enable xmatch) \
		$(use_enable cython) \
		$(use_enable lcfg) \
		$(use_enable curl)
}
