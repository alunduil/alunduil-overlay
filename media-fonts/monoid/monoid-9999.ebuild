# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit font multiprocessing git-r3

DESCRIPTION="Open Source Coding Font"
HOMEPAGE="http://larsenwork.com/monoid"
EGIT_REPO_URI="https://github.com/larsenwork/${PN}.git"
SRC_URI=""

LICENSE="MIT OFL-1.1"
SLOT="0"
KEYWORDS=""
IUSE=""

RESTRICT="binchecks strip"

DEPEND="media-gfx/fontforge[python]"
RDEPEND=""

FONT_SUFFIX="ttf"
FONT_S="${S}/_release"

DOCS="Readme.md"

src_compile() {
	local NJOBS=$(makeopts_jobs)

	for file in Source/*.sfdir; do
		Scripts/build.py ${NJOBS} ${NJOBS} "${file}" || die "build failed for ${file}"
	done
}
