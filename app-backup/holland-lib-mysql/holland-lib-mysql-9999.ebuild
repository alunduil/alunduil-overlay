# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABI="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/holland-backup/holland.git"

DESCRIPTION="Provides convenience methods for MySQL with Holland."
HOMEPAGE="http://hollandbackup.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORD=""
IUSE=""

DEPEND="dev-python/mysql-python"
RDEPEND="${DEPEND}"

S="${PN%%-*}-${PVR}/plugins/${PN//-/.}"
