# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit bash-completion-r1 distutils-r1 vcs-snapshot

DESCRIPTION="Use novaclient with multiple OpenStack nova environments the easy way"
HOMEPAGE="https://github.com/rackerhacker/supernova"
SRC_URI="https://github.com/major/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	"
RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/keyring-0.9.2[${PYTHON_USEDEP}]
	dev-python/rackspace-novaclient[${PYTHON_USEDEP}]
"

python_compile_all() {
	use doc && emake -C "${S}"/docs html
}

python_install_all() {
	use doc && local HTML_DOCS=( "${S}"/docs/_build/html/. )
	use examples && local EXAMPLES=( "${S}"/example_configs/. )

	distutils-r1_python_install_all

	newbashcomp "${S}"/contrib/${PN}-completion.bash ${PN}
}
