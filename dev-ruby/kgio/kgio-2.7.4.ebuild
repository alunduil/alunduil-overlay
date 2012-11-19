# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

DESCRIPTION="provides non-blocking I/O methods for Ruby without raising
exceptions on EAGAIN and EINPROGRESS"
HOMEPAGE="http://bogomips.org/kgio/"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
