# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit distutils mercurial

EHG_REPO_URL="https://code.google.com/p/passlib/"

DESCRIPTION="Password hashing library which provides cross-platform
implementations of hashing algorithms; as well as a management framework
for existing password hashes."
HOMEPAGE="http://code.google.com/p/passlib/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
