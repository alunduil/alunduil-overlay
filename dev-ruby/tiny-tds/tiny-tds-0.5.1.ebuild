# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19"

inherit vcs-snapshot ruby-fakegem

DESCRIPTION="A modern, simple and fast FreeTDS library for Ruby using DB-Library"
HOMEPAGE="https://github.com/rails-sqlserver/tiny_tds"
SRC_URI="https://github.com/rails-sqlserver/tiny_tds/archive/v0.5.1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

ruby_add_rdepend "dev-db/freetds"
