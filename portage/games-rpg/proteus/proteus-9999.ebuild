# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games
inherit cmake-utils

DESCRIPTION="A new RPG style game produced by MSUM's ACM."
HOMEPAGE="http://www.alunduil.com/programs/proteus"
SRC_URI="http://www.alunduil.com/svn/distfiles/proteus/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

