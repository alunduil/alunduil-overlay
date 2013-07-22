# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby18 ruby19 ruby20 ree18 jruby"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Use Salt as a Vagrant provisioner."
HOMEPAGE="https://github.com/saltstack/salty-vagrant"
SRC_URI="https://github.com/saltstack/${PN}/archive/${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	app-emulation/vagrant
	"
