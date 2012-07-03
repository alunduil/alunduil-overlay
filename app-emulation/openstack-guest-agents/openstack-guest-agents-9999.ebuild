# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit git-2 distutils

EGIT_REPO_URI="git://github.com/rackspace/openstack-guest-agents-unix.git"

DESCRIPTION="Openstack Unix Guest Agent"
HOMEPAGE="https://github.com/rackspace/openstack-guest-agents-unix"
SRC_URI=""

LICENSE="apache"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

