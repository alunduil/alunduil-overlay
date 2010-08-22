# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils git

DESCRIPTION="Provides a safe LVM snapshot backup for MySQL with Holland."
HOMEPAGE="http://hollandbackup.org/"

IUSE=""

LICENSE="BSD"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"
SRC_URI=""

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

	cd "${WORKDIR}"/${MY_P}

	insinto /etc/holland/providers
	newins config/providers/mysql-lvm.conf mysql-lvm.conf || \
		die "Could not insert mysql-lvm configuration!"
}
