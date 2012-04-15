# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"

DESCRIPTION="Uses /dev/random. A bit more of an example than
holland.backup.example."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORD=""
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

MY_S="${S}/plugins/${PN//-/.}"

src_compile() {
	cd "${MY_S}"
	distutils_src_compile
}

src_install() {
	cd "${MY_S}"
	distutils_src_install

	cd "${S}"

	insinto /etc/holland/providers
	doins config/providers/random.conf || die "Could not insert random configuration!"

	if use examples; then
		insinto /etc/holland/backupsets/examples
		doins config/backupsets/examples/random.conf || die "Insert failed."
	fi
}
