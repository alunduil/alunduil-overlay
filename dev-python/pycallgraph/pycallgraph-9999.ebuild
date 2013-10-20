# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit git-2 distutils-r1

EGIT_REPO_URI="git://github.com/gak/pycallgraph.git"

DESCRIPTION="pycallgraph is a Python module that creates call graphs for Python
programs."
HOMEPAGE="http://pycallgraph.slowchop.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
