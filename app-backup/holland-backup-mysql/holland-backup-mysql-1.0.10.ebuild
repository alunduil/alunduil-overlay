# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Holland MySQL"
HOMEPAGE="http://www.hollandbackup.org/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+mysqldump"

CDEPEND="
	mysqldump? ( app-backup/holland-backup-mysqldump )
"
DEPEND="
	${CDEPEND}
"
RDEPEND="
	${CDEPEND}
"
