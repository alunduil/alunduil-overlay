# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Backup Framework"
HOMEPAGE="http://hollandbackup.org/"
SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples +mysql postgresql"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
RDEPEND="
    postgresql? ( app-backup/holland-backup-pgdump )
	mysql? ( app-backup/holland-backup-mysqldump )
	examples? ( app-backup/holland-backup-example )
	"

python_install() {
	distutils-r1_python_install

	keepdir /var/log/holland

	keepdir /etc/holland
	insinto /etc/holland
	doins config/holland.conf

	keepdir /etc/holland/backupsets
	insinto /etc/holland/backupsets
	doins config/backupsets/default.conf

	if use examples; then
		dodir /etc/holland/backupsets/examples
		doins config/backupsets/default.conf
	fi

	doman docs/man/holland.1

	if use doc; then
		dodoc docs/man/README
	fi

	keepdir /etc/holland/providers
}

pkg_postinst() {
	if use mysql; then
		elog "It is recommended to setup a ~/.my.cnf configuration for the user that holland"
		elog "will be running as.  This will remove the need to ocnfigure a username and "
		elog "password in the holland configuration itself."
		elog ""
		elog "The structure of the .my.cnf file should resemble the following:"
		elog "[client]"
		elog "user=root"
		elog "password=ROOT_MYSQL_PASSWORD"
	fi
}
