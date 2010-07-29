# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Holland is an Open Source backup framework originally developed at
Rackspace and written in Python. Its goal is to help facilitate backing up
databases with greater configurability, consistency, and ease. Holland currently
focuses on MySQL, however future development will include other database
platforms and even non-database related applications. Because of its plugin
structure, Holland can be used to backup anything you want by whatever means you
want."
HOMEPAGE="http://hollandbackup.org/"

IUSE="doc mysql"

KEYWORDS="-* amd64 x86"
LICENSE="BSD"
SLOT="0"

SRC_URI="http://www.alunduil.com/svn/distfiles/holland/${P}.tar.bz2"
SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${P}.tar.gz"

DEPEND="dev-lang/python
	dev-python/sphinx
	dev-python/setuptools
	"
RDEPEND="${DEPEND}"
PDEPEND="
	mysql? ( app-backup/holland-backup-mysqldump )
	app-backup/holland-lib-common
	"

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install

	keepdir /var/log/holland

	keepdir /etc/holland
	insinto /etc/holland
	newins config/holland.conf holland.conf || \
		die "Failed Inserting Holland Configuration!"

	keepdir /etc/holland/backupsets
	insinto /etc/holland/backupsets
	newins config/backupsets/default.conf default.conf || \
		die "Failed Inserting Holland Default BackupSet Configuration!"

	doman docs/man/holland.1 || die "Failed to insert man page!"

	if use doc; then
		dodoc docs/man/README
		dodoc docs/test_cases.txt
	fi

	# TODO mysql should be a use flag?

	keepdir /etc/holland/providers
	insinto /etc/holland/providers

	if use mysql; then
	newins config/providers/mysqldump.conf mysqldump.conf || \
		die "Failed to insert mysqldump configuration!"
	fi
}
