# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="virtual for holland mysql"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xtrabackup +mysqldump lvm"

DEPEND=""
RDEPEND="
	${DEPEND}
	xtrabackup? ( app-backup/holland-backup-xtrabackup )
	mysqldump? ( app-backup/holland-backup-mysqldump )
	lvm? ( app-backup/holland-backup-mysql-lvm )
	"
