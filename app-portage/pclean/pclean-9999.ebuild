# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit git-2 distutils

EGIT_REPO_URI="git://github.com/alunduil/pclean.git"

DESCRIPTION="Automated /etc/portage/package.* cleaner."
HOMEPAGE="http://www.alunduil.com/programs/pclean/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

