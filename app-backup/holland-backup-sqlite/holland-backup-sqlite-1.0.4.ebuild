# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

EAPI="3"

DESCRIPTION="Dump SQLite databases into pure ASCII SQL text for archiving with
Holland."
HOMEPAGE="http://hollandbackup.org/"

KEYWORDS="-* amd64 x86"
LICENSE="BSD"
SLOT="0"

MY_P=${P%%-*}-${P##*-}

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

MY_DIR="$(echo ${PN} | tr '-' '.')"

DEPEND="
	app-backup/holland
	dev-db/sqlite
	"
RDEPEND="${DEPEND}"
PDEPEND=""

RESTRICT="mirror"
PROPERTIES=""

src_compile() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_compile
}

src_install() {
	cd ${MY_P}/plugins/${MY_DIR}
	distutils_src_install

	cd ${WORKDIR}/${MY_P}

	insinto /etc/holland/providers
	newins config/providers/sqlite.conf sqlite.conf || \
		die "Could not insert sqlite configuration!"
}

