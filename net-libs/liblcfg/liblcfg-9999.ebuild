# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools

EGIT_REPO_URI="git://git.carnivore.it/liblcfg.git"

DESCRIPTION=""
HOMEPAGE="http://dionaea.carnivore.it/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

EGIT_SOURCEDIR="${S}"
S="${S}/code"

src_prepare() {
	eautoreconf
}
