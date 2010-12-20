# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19 ree18"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_EXTRADOC="README*"
RUBY_FAKEGEM_BINWRAP="multipart-post"

inherit ruby-fakegem

DESCRIPTION="Adds multipart POST capability to net/http"
HOMEPAGE="https://github.com/nicksieger/multipart-post"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="-* ~amd64 ~x86"

RESTRICT="mirror"

ruby_add_bdepend "test? (
		dev-ruby/mocha
		dev-ruby/rspec:0
	)"
