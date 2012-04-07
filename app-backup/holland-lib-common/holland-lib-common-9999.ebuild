# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"

DESCRIPTION="holland core libraries"
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-backup/holland"
RDEPEND="${DEPEND}"

MY_P="${PN%%-*}-${PVR}"
MY_DIR="${PN//-/.}"

src_compile() {
	cd "${MY_P}/plugins/${MY_DIR}"
	distutils_src_compile
}

src_install() {
	cd "${MY_P}/plugins/${MY_DIR}"
	distutils_src_install

	rm -rf "${D}/usr/bin" # binaries are provided by holland
}
