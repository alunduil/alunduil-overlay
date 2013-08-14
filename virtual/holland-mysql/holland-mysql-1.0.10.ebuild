# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="virtual for holland mysql"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="xtrabackup hotcopy"

DEPEND=""
RDEPEND="
	${DEPEND}
	xtrabackup? ( app-backup/holland-backup-xtrabackup )
	hotcopy? ( app-backup/holland-backup-mysqlhotcopy )
	"
