# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="IDE that lets you modify running programs and embed anything;
providing real time feedback"
HOMEPAGE="http://www.lighttable.com/"
SRC_URI="http://temp2.kodowa.com.s3.amazonaws.com/playground/bins/${PN}Linux.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

QA_PREBUILT=opt/bin/${PN}
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	into /opt
	dobin ${PN}
	dolib.so libffmpegsumo.so
}
