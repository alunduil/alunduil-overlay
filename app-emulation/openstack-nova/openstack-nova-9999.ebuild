# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3* *-jython"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/nova.git"

DESCRIPTION="OpenStack Compute (Nova)"
HOMEPAGE="https://launchpad.net/nova"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="sqlite mysql postgres"

DEPEND=""
RDEPEND="${DEPEND}
	sqlite? ( dev-db/sqlite )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )"
