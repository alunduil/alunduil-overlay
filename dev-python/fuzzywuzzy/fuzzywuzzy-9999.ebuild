# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3*"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/seatgeek/fuzzywuzzy.git"

DESCRIPTION="Fuzzy String Matching in Python"
HOMEPAGE="https://github.com/seatgeek/fuzzywuzzy/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
