# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland is an Open Source backup framework originally developed at
Rackspace and written in Python"
HOMEPAGE="http://hollandbackup.org/"

IUSE="doc examples lvm maatkit +mysql postgresql sqlite"

KEYWORDS="-* amd64 x86"
LICENSE="BSD"
SLOT="0"

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${P}.tar.gz"

DEPEND="dev-lang/python
	dev-python/sphinx
	dev-python/setuptools
	"
RDEPEND="${DEPEND}"
PDEPEND="
	app-backup/holland-lib-common
	mysql? ( app-backup/holland-backup-mysqldump )
	sqlite? ( app-backup/holland-backup-sqlite )
	postgresql? ( app-backup/holland-backup-pgdump )
	lvm? ( mysql? ( app-backup/holland-backup-mysql-lvm ) )
	examples? (
		app-backup/holland-backup-example
		app-backup/holland-backup-random
		)
	maatkit? (
		app-backup/holland[mysql]
		app-backup/holland-backup-maatkit
		)
	"

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install

	keepdir /var/log/holland

	keepdir /etc/holland
	insinto /etc/holland
	doins config/holland.conf || die "Failed Inserting Holland
		Configuration!"

	keepdir /etc/holland/backupsets
	insinto /etc/holland/backupsets
	doins config/backupsets/default.conf || die "Failed Inserting Holland
		Default BackupSet Configuration!"

	dodir /etc/holland/backupsets/examples

	doman docs/man/holland.1 || die "Failed to insert man page!"

	if use doc; then
		dodoc docs/man/README
		dodoc docs/test_cases.txt
	fi

	keepdir /etc/holland/providers
}
