# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-jython"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/horizon.git"

DESCRIPTION="Horizon is the dashboard for OpenStack; based on a Django module
called django-openstack."
HOMEPAGE="https://launchpad.net/horizon"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
