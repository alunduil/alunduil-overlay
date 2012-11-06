# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit git-2 distutils

EGIT_REPO_URI="git://github.com/alunduil/upkern.git"

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/upkern/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="module-rebuild initrd"

DEPEND=""
RDEPEND="${DEPEND}
	>=app-portage/gentoolkit-0.3.0.7
	module-rebuild? ( sys-kernel/module-rebuild )
	initrd? ( sys-kernel/dracut )
	"
