# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit git-2 distutils-r1

EGIT_REPO_URI="git://github.com/alunduil/upkern.git"

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="https://github.com/alunduil/upkern"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="module-rebuild initrd"

DEPEND=""
RDEPEND="
	${DEPEND}
	>=app-portage/gentoolkit-0.3.0.7
	module-rebuild? ( sys-kernel/module-rebuild )
	initrd? ( sys-kernel/dracut )
	"
