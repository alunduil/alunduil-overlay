# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland Core Plugins"
HOMEPAGE="http://www.hollandbackup.org/"
SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples +mysql postgres sqlite"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="
	${PYTHON_DEPS}
	mysql? ( =virtual/holland-backup-mysql-${PV}[${PYTHON_USEDEP}] )
	postgres? ( =app-backup/holland-backup-pgdump-${PV}[${PYTHON_USEDEP}] )
	sqlite? ( =app-backup/holland-backup-sqlite-${PV}[${PYTHON_USEDEP}] )
	examples? (
		=app-backup/holland-backup-example-${PV}[${PYTHON_USEDEP}]
		=app-backup/holland-backup-random-${PV}[${PYTHON_USEDEP}]
	)
"

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	use doc && local DOCS=( README config/README config/providers/README docs/man/README docs/man/holland.rst )
	use doc && local HTML_DOCS=( docs/build/html/. )

	distutils-r1_python_install_all

	keepdir /var/log/holland

	keepdir /etc/holland
	keepdir /etc/holland/backupsets
	keepdir /etc/holland/providers

	insinto /etc/holland
	doins config/holland.conf

	insinto /etc/holland/backupsets
	doins config/backupsets/default.conf

	doman docs/man/holland.1
}
