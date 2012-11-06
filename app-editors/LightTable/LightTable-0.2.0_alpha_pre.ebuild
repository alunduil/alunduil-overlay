# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Light Table is a new interactive IDE that lets you modify running
programs and embed anything from websites to games. It provides the real time
feedback we need to not only answer questions about our code, but to understand
how our programs really work."
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
