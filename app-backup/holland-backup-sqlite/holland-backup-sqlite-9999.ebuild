# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

DESCRIPTION="Dump SQLite databases into pure ASCII SQL text for archiving with
Holland."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORD=""
IUSE="examples"

DEPEND="app-backup/holland
	dev-db/sqlite"
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

	cd "${WORKDIR}/${MY_P}"

	insinto /etc/holland/providers
	doins config/providers/sqlite.conf || die "Could not insert sqlite configuration!"

	if use examples; then
		insinto /etc/holland/backupsets/examples
		doins config/backupsets/examples/sqlite.conf || die "Insert failed."
	fi
}
