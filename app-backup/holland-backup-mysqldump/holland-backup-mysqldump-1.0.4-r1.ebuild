# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils

DESCRIPTION="Plugin support to provide backup and restore functionality through
mysqldump backups with Holland."
HOMEPAGE="http://hollandbackup.org/"

IUSE=""

KEYWORDS="-* amd64 x86"
LICENSE="GPL-2"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
	app-backup/holland-lib-mysql
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

	cd "${WORKDIR}"/${MY_P}

	insinto /etc/holland/providers
	doins config/providers/mysqldump.conf || die "Failed to insert mysqldump configuration!"

	insinto /etc/holland/backupsets/examples
	doins config/backupsets/examples/mysqldump.conf || die "Failed to insert
	mysqldump backupset example!"

	doins config/backupsets/examples/mysqldump-lvm.conf || die "Failed to insert
	mysqldump-lvm backupset example!"
}
