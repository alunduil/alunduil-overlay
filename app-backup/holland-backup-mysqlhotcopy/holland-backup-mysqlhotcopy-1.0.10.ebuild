# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Holland MySQL (MyISAM) Hotcopy Plugin"
HOMEPAGE="http://www.hollandbackup.org/"

MY_P="${P%%-*}-${P##*-}"

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="
	${PYTHON_DEPS}
	=app-backup/holland-lib-common-${PV}[${PYTHON_USEDEP}]
	=app-backup/holland-lib-mysql-${PV}[${PYTHON_USEDEP}]
"
PDEPEND="=app-backup/holland-${PV}[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}/plugins/${PN//-/.}"

python_install_all() {
	use doc && local DOCS=( README docs/man/holland-mysqlhotcopy.rst )

	distutils-r1_python_install_all

	keepdir /etc/holland
	keepdir /etc/holland/backupsets
	keepdir /etc/holland/providers

	insinto /etc/holland/backupsets
	doins "${S}"/../../config/backupsets/examples/${PN##*-}.conf

	insinto /etc/holland/providers
	doins "${S}"/../../config/providers/${PN##*-}.conf

	doman docs/man/holland-mysqlhotcopy.5
}