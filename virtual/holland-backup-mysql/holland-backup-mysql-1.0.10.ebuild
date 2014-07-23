# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland MySQL"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lvm +mysqldump mysqlhotcopy"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

CDEPEND="
	lvm? ( app-backup/holland-backup-mysql-lvm[${PYTHON_USEDEP}] )
	mysqldump? ( app-backup/holland-backup-mysqldump[${PYTHON_USEDEP}] )
	mysqlhotcopy? ( app-backup/holland-backup-mysqlhotcopy[${PYTHON_USEDEP}] )
"
DEPEND="
	${CDEPEND}
"
RDEPEND="
	${CDEPEND}
"
