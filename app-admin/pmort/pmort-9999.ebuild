# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit git-2 distutils

EGIT_REPO_URI="git://github.com/alunduil/pmort.git"

DESCRIPTION="Simple local post-mortem analysis logging"
HOMEPAGE="http://www.alunduil.com/programs/pmort/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/python-daemon
	"
