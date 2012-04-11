# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3*"

inherit git-2 distutils

EGIT_REPO_URI="https://github.com/openstack/glance.git"

DESCRIPTION="The Glance project provides services for discovering, registering,
and retrieving virtual machine images."
HOMEPAGE="https://launchpad.net/glance"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install

	if ! use test; then
		find "${D}" -iname "*test*" -exec rm -rf "{}" \;
	fi
}
