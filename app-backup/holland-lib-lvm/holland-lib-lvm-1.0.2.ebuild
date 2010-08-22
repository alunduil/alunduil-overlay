# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="holland lvm libraries"
HOMEPAGE="http://hollandbackup.org/"

IUSE=""

KEYWORDS="-* amd64 x86"
LICENSE="BSD"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
	sys-fs/lvm2
	"
RDEPEND="${DEPEND}
	"
PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_unpack() {
	unpack ${MY_P}.tar.gz
}

src_compile() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_compile
}

src_install() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_install
}

