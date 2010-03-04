# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games
inherit cmake-utils

DESCRIPTION="A new RPG style game produced by MSUM's ACM."
HOMEPAGE="http://www.alunduil.com/programs/proteus"

IUSE="doc test"

KEYWORDS="-* ~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

SRC_URI="http://www.alunduil.com/svn/distfiles/proteus/${P}.tar.bz2"

RDEPEND="dev-libs/boost
	dev-libs/libyaml
	test? ( dev-util/cppunit )
"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
"
#PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

S="${WORKDIR}/${PN}"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_test() {
	if use test; then
		cmake-utils_src_test
	fi
}

