# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils

DESCRIPTION="An authentication and authorization toolkit for WSGI applications
and frameworks"
HOMEPAGE="http://pypi.python.org/pypi/AuthKit/"
SRC_URI="mirror://pypi.python.org/packages/source/A/AuthKit/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/elementtree-1.2
	<=dev-python/elementtree-1.3
	"
