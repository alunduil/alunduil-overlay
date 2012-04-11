# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"

DESCRIPTION="Provides a safe LVM snapshot backup for MySQL with Holland."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-backup/holland-lib-lvm"
RDEPEND="${DEPEND}"

MY_P="${PN%%-*}-${PVR}"
MY_DIR="${PN//-/.}"
MY_DIR="${MY_DIR//.lvm/_lvm/}"

src_compile() {
	cd "${MY_P}/plugins/${MY_DIR}"
	distutils_src_compile
}

src_install() {
	cd "${MY_P}/plugins/${MY_DIR}"
	distutils_src_install

	cd "${WORKDIR}/${MY_P}"

	insinto /etc/holland/providers
	newins config/providers/mysql-lvm.conf mysql-lvm.conf || die "Insert
	failed."
}
