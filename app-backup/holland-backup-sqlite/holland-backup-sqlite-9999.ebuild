# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS=""

inherit distutils git-2

EGIT_REPO_URI="https://github.com/holland-backup/holland.git"

DESCRIPTION="Dump SQLite databases into pure ASCII SQL text for archiving with
Holland."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORD=""
IUSE="examples"

DEPEND="dev-db/sqlite"
RDEPEND="${DEPEND}"

MY_S="${S}/plugins/${PN//-/.}"

src_compile() {
	cd "${MY_S}" || die "Failed to change directory"
	distutils_src_compile
}

src_install() {
	cd "${MY_S}" || die "Failed to change directory"
	distutils_src_install

	cd "${S}" || die "Failed to change directory"

	insinto /etc/holland/providers
	doins config/providers/sqlite.conf || die "Could not insert sqlite configuration!"

	if use examples; then
		insinto /etc/holland/backupsets/examples
		doins config/backupsets/examples/sqlite.conf || die "Insert failed."
	fi
}
