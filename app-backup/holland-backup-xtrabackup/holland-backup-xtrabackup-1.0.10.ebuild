# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland plugin for xtrabackup"
HOMEPAGE="http://hollandbackup.org/"

MY_P="${P%%-*}-${P##*-}"

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-backup/holland-lib-common
	app-backup/holland-lib-mysql
	"
PDEPEND="app-backup/holland[examples=]"

S="${WORKDIR}/${MY_P}/plugins/${PN//-/.}"

python_install() {
	distutils-r1_python_install

	cd "../.." || die

	insinto /etc/holland/providers
	doins config/providers/xtrabackup.conf

	if use examples; then
		insinto /etc/holland/backupsets/examples
		doins config/backupsets/examples/xtrabackup.conf
	fi
}
