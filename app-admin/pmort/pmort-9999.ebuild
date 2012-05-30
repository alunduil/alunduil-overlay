# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit git-2 distutils eutils

EGIT_REPO_URI="git://github.com/alunduil/pmort.git"

DESCRIPTION="Simple local post-mortem analysis logging"
HOMEPAGE="http://www.alunduil.com/programs/pmort/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/python-daemon
	"

pkg_setup() {
	python_pkg_setup
	enewuser pmort
	enewgroup pmort
}

src_install() {
	distutils_src_install

	keepdir /etc/pmort
	insinto /etc/pmort
	newins config/pmort.conf pmort.conf || die "Failed newins"

	newinitd config/init.sh pmort || die "Failed newinitd"

	insinto /etc/logrotate.d
	newins config/logrotate.conf pmort || die "Failed newins"

	dodir "/var/cache/pmort" || die "Failed dodir"
	dodir "/var/log/pmort" || die "Failed dodir"

	fowners pmort:pmort "/var/cache/pmort" || die "Failed fowners"
	fowners pmort:pmort "/var/log/pmort" || die "Failed fowners"

	rm "${D}"/etc || die "Failed rm"
}
