# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Convenience methods for MySQL in Holland"
HOMEPAGE="http://hollandbackup.org/"

MY_P="${P%%-*}-${P##*-}"

SRC_URI="http://hollandbackup.org/releases/stable/${PV%.*}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-backup/holland"
RDEPEND="
	${DEPEND}
	dev-python/mysql-python
	"

S="${WORKDIR}/${MY_P}/plugins/$(echo ${PN} | tr '-' '.')"
