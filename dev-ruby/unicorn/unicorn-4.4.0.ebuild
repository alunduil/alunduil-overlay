# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="Rack HTTP server designed for efficiency"
HOMEPAGE="http://unicorn.bogomips.org/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_install() {
	ruby-ng_src_install

	newinitd "${FILESDIR}/unicorn.initd" unicorn
	newconfd "${FILESDIR}/unicorn.confd" unicorn
}

pkg_postinst() {
	elog "This installation of unicorn supports multiple instances.  To enable"
	elog "this you should create a symlink in /etc/init.d/ for each instance"
	elog "to /etc/init.d/unicorn and create the matching conf files in"
	elog "/etc/conf.d/."
}
