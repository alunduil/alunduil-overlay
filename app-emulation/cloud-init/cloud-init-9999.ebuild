# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit bzr distutils eutils

EBZR_REPO_URI="https://code.launchpad.net/~cloud-init-dev/cloud-init/trunk"

DESCRIPTION="init scripts configuring and customizing cloud images"
HOMEPAGE="http://launchpad.net/cloud-init/nstaneces"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cheetah
	"
