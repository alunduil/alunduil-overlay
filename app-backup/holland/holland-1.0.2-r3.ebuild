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
PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_install() {
	distutils_src_install

	keepdir /var/log/holland
	keepdir /etc/holland
	insinto /etc/holland
	newins config/holland.conf holland.conf || \
		die "Failed Inserting Holland Configuration!"
	newins config/backupsets backupsets || \
		die "Failed Inserting Holland BackupSet Configuration!"
}
