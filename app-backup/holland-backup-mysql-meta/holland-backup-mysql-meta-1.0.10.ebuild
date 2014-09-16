# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=TRUE

inherit python-r1

DESCRIPTION="Holland MySQL"
HOMEPAGE="http://www.hollandbackup.org/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lvm +mysqldump mysqlhotcopy"

DEPEND=""
RDEPEND="
	lvm? ( ~app-backup/holland-backup-mysql-lvm-${PV}[${PYTHON_USEDEP}] )
	mysqldump? ( ~app-backup/holland-backup-mysqldump-${PV}[${PYTHON_USEDEP}] )
	mysqlhotcopy? ( ~app-backup/holland-backup-mysqlhotcopy-${PV}[${PYTHON_USEDEP}] )
"
PDEPEND="=app-backup/holland-${PV}[${PYTHON_USEDEP}]"
