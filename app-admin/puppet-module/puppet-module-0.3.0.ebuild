# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/facter/facter-1.5.8.ebuild,v 1.3 2010/11/04 03:13:30 matsuu Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"
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

ruby_add_bdepend ">=app-admin/puppet-0.25
    test? (
		dev-ruby/mocha
		dev-ruby/rspec:0
	)"
