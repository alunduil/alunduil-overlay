# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools flag-o-matic

EGIT_REPO_URI="git://git.carnivore.it/dionaea.git"

DESCRIPTION="nepenthes successor"
HOMEPAGE="http://dionaea.carnivore.it/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="cspm gc ssl +nl xmatch"

DEPEND="
	net-libs/liblcfg
	net-libs/libemu
	nl? ( dev-libs/libnl )
	dev-libs/libev
	>=dev-python/cython-0.15
	dev-lang/python[sqlite]
	net-libs/udns
	net-misc/curl
	net-libs/libpcap
	ssl? ( dev-libs/openssl )
	"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewuser dionaea
	enewgroup dionaea
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable cspm) \
		$(use_enable gc) \
		$(use_enable ssl) \
		$(use_enable nl netfilter_queue) \
		$(use_enable xmatch) \
		--disable-debug \
		--disable-werror
}

src_install() {
	keepdir /etc/dionaea

	emake DESTDIR="${D}" install
	dodoc README
}
