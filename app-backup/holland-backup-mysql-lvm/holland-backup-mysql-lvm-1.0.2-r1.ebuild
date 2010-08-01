# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

EAPI="3"

DESCRIPTION="This script provides support for performing safe LVM snapshot
backups for MySQL databases with Holland."
HOMEPAGE="http://hollandbackup.org/"

KEYWORDS="-* amd64 x86"
LICENSE="BSD"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
	app-backup/holland-lib-lvm
	"
RDEPEND="${DEPEND}
	"
PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_compile() {
	cd ${MY_P}/plugins/$(echo ${MY_DIR} | sed -e 's/.lvm/_lvm/g')
	distutils_src_compile
}

src_install() {
	cd ${MY_P}/plugins/$(echo ${MY_DIR} | sed -e 's/.lvm/_lvm/g')
	distutils_src_install
}

