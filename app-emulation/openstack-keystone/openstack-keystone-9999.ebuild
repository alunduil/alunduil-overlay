# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/keystone.git"

DESCRIPTION="Identity Service for Openstack"
HOMEPAGE="https://launchpad.net/keystone"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="ldap sqlite mysql postgres"

DEPEND=""
RDEPEND="${DEPEND}
  ldap? ( net-nds/openldap )
  sqlite? ( dev-db/sqlite )
  mysql? ( virtual/mysql )
  postgres? ( dev-db/postgresql-base )"
