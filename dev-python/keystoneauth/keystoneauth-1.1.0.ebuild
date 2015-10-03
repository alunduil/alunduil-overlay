# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Authentication Library for OpenStack Identity"
HOMEPAGE="http://www.openstack.org/"
SRC_URI="https://github.com/openstack/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/pbr-1.8[${PYTHON_USEDEP}]
	test? (
		>=dev-python/fixtures-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/keyring-2.1[${PYTHON_USEDEP}]
		!~dev-python/keyring-3.3[${PYTHON_USEDEP}]
		>=dev-python/mock-1.2[${PYTHON_USEDEP}]
		>=dev-python/mox3-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/oauthlib-0.6[${PYTHON_USEDEP}]
		>=dev-python/oslo-config-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/os-testr-0.1.0[${PYTHON_USEDEP}]
		>=dev-python/pycrypto-2.6[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/tempest-lib-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/testrepository-0.0.18[${PYTHON_USEDEP}]
		>=dev-python/testresources-0.2.4[${PYTHON_USEDEP}]
		>=dev-python/testtools-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/webob-1.2.3[${PYTHON_USEDEP}]
	)
	doc? (
		>=dev-python/oslo-sphinx-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-1.1.2[${PYTHON_USEDEP}]
		!~dev-python/sphinx-1.2.0[${PYTHON_USEDEP}]
		<dev-python/sphinx-1.3[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/iso8601-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/requests-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.5.0[${PYTHON_USEDEP}]
"

python_compile_all() {
	use doc && esetup.py build_sphinx
}

python_test() {
	distutils_install_for_testing

	rm -rf .testrepository || die "couldn't remove '.testrepository' under ${EPTYHON}"

	testr init || die "testr init failed under ${EPYTHON}"
	testr run || die "testr run failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/build/html/. )

	distutils-r1_python_install_all
}
