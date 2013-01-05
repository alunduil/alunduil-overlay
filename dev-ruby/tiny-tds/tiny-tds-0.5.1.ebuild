# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A modern, simple and fast FreeTDS library for Ruby using DB-Library"
HOMEPAGE="http://rubygems.org/gems/tiny_tds/"
SRC_URI="http://rubygems.org/downloads/tiny_tds-0.5.1.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
