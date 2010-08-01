# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils git

EAPI="3"

DESCRIPTION=""
HOMEPAGE="http://hollandbackup.org/"

LICENSE="BSD"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"
SRC_URI=""

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

src_compile() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_compile
}

src_install() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_install
}

