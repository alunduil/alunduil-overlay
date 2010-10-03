# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils git

DESCRIPTION="holland core libraries"
HOMEPAGE="http://hollandbackup.org/"

IUSE=""

LICENSE="GPLv2"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"
SRC_URI=""

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
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
