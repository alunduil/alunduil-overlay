# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/openstack-guest-agents-unix/openstack-guest-agents-unix-1.39.0-r2.ebuild,v 1.1 2014/06/22 04:16:14 robbat2 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit autotools python-single-r1 vcs-snapshot

DESCRIPTION="Openstack Unix Guest Agent"
HOMEPAGE="http://github.com/rackerlabs/openstack-guest-agents-unix"
SRC_URI="https://github.com/rackerlabs/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

CDEPEND="
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/pyxenstore[${PYTHON_USEDEP}]
	dev-util/patchelf
	${PYTHON_DEPS}
"
DEPEND="
	${CDEPEND}
	test? (
		dev-python/mox[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
	)
"
RDEPEND="${CDEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	epatch \
		"${FILESDIR}"/4453b4773688eef6c60736d9cf07100716308a5e.patch

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install

	doinitd scripts/gentoo/nova-agent
}

pkg_postinst() {
	elog "If you would like to utilize openstack-guest-agents-unix, add 'nova-agent' to"
	elog "your 'default' runlevel:"
	elog "  rc-update add nova-agent default"
}
