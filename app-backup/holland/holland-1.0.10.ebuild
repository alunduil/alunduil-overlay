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
IUSE="doc examples lvm maatkit mysql postgresql sqlite"

DEPEND=""
RDEPEND="${DEPEND}"

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
