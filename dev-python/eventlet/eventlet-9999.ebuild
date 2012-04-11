# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3*"

inherit distutils mercurial

EHG_REPO_URI="https://bitbucket.org/which_linden/eventlet"

DESCRIPTION="Eventlet is a concurrent networking library for Python that allows
you to change how you run your code, not how you write it."
HOMEPAGE="http://eventlet.net"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
