# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_3 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/alunduil/pmort.git"

DESCRIPTION="Simple local post-mortem analysis logging."
HOMEPAGE="https://github.com/alunduil/pmort"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

DEPEND="
	dev-python/jinja
	test? (
		dev-python/nose[coverage]
		dev-python/mock
		)
	"
RDEPEND="
	dev-python/crumbs
	"

python_configure() {
	PYTHONPATH='.' scripts/render_templates conf || die 'render'
}

python_install() {
	distutils-r1_python_install

	insinto /etc/cron.daily
	doins conf/cron.daily/pmort.cron

	newinitd conf/init.d/pmort.gentoo pmort

	insinto /etc/logrotate.d
	doins conf/logrotate.d/pmort.conf

	keepdir /etc/pmort
	insinto /etc/pmort
	doins conf/pmort/pmort.ini
}

python_test() {
	nosetests || die
}
