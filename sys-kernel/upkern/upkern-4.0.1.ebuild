# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="https://github.com/alunduil/upkern"
SRC_URI="https://github.com/alunduil/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="module-rebuild initrd"

DEPEND=""
RDEPEND="
	${DEPEND}
	>=app-portage/gentoolkit-0.3.0.7
	module-rebuild? ( sys-kernel/module-rebuild )
	initrd? ( sys-kernel/dracut )
	"
