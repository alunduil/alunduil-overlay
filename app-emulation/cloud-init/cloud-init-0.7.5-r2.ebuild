# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/cloud-init/cloud-init-0.7.5-r1.ebuild,v 1.3 2014/08/06 06:44:38 patrick Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=TRUE

inherit distutils-r1 eutils multilib

DESCRIPTION="Cloud instance initialization"
HOMEPAGE="http://launchpad.net/cloud-init"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="syslog test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

CDEPEND="
	dev-python/cheetah[${PYTHON_USEDEP}]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/jsonpatch[${PYTHON_USEDEP}]
	dev-python/oauth[${PYTHON_USEDEP}]
	>=dev-python/prettytable-0.7.1[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
DEPEND="
	${PYTHON_DEPS}
	test? (
		${CDEPEND}
		>=dev-python/httpretty-0.7.1[${PYTHON_USEDEP}]
		dev-python/mocker[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pep8[${PYTHON_USEDEP}]
		dev-python/pyflakes[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		sys-apps/iproute2
	)
"
RDEPEND="
	${PYTHON_DEPS}
	${CDEPEND}
"

PATCHES=( "${FILESDIR}"/${P}-tests-exclude.patch )

#python_prepare_all() {
#	distutils-r_python_prepare_all
#}

python_test() {
	# These tests are not broken but expect to locate an installed exe file
	# other than where a gentoo system installs it;  (/bin/ip sought in /sbin)
	# See cloudinit/sources/DataSourceOpenNebula.py for possible patching
	sed -e 's:test_hostname:_&:' \
		-e 's:test_network_interfaces:_&:' \
		-i tests/unittests/test_datasource/test_opennebula.py
	emake test
}

python_install() {
	distutils-r1_python_install
	for svc in config final init init-local; do
		newinitd "${WORKDIR}/${P}/sysvinit/gentoo/cloud-${svc}" "cloud-${svc}"
	done
}
