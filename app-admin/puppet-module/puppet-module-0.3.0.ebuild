# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19 ree18"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_EXTRADOC="README*"
RUBY_FAKEGEM_BINWRAP="puppet-module"

inherit ruby-fakegem

DESCRIPTION="The Puppet Module Tool creates, installs and searches for modules on the Puppet Forge"
HOMEPAGE="https://github.com/puppetlabs/puppet-module-tool/blob/master/README.markdown"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="-* ~amd64 ~x86"

RESTRICT="mirror"

ruby_add_bdepend "test? (
		dev-ruby/mocha
		dev-ruby/rspec:0
	)
	dev-ruby/facets"

PDEPEND="${PDEPEND}
  =app-admin/puppet-0.25*
  "
