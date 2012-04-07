# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"

DESCRIPTION="Holland is an Open Source backup framework originally developed at
Rackspace and written in Python."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="doc examples lvm maatkit +mysql postgresql sqlite"

DEPEND="dev-python/sphinx
	dev-python/setuptools
	"
RDEPEND="${DEPEND}
	app-backup/holland-lib-common"
PDEPEND="mysql? ( app-backup/holland-backup-mysqldump
		virtual/mysql )
	sqlite? ( app-backup/holland-backup-sqlite )
	postgresql? ( app-backup/holland-backup-pgdump )
	lvm? ( mysql? ( app-backup/holland-backup-mysql-lvm ) )
	examples? (
		app-backup/holland-backup-example
		app-backup/holland-backup-random
		)
	maatkit? (
		app-backup/holland-backup-maatkit
		)
	"

src_install() {
	distutils_src_install

	# Setup the configuration directory ...
	keepdir /etc/holland
	insinto /etc/holland

	newins config/holland.conf holland.conf || die "Failed to insert"

	keepdir /etc/holland/backupsets
	insinto /etc/holland/backupsets

	newins config/backupsets/default.conf default.conf || die "Failed to insert"

	keepdir /etc/holland/providers

	doman docs/man/holland.1 || dir "Failed to doman"

	if use doc; then
		dodoc README
	fi
}
