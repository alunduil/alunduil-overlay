# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/raxsavvy/margarine.git"

DESCRIPTION="Butter than web browsing and bookmarking."
HOMEPAGE="https://github.com/raxsavvy/margarine"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		)
	"
RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	=dev-python/pika-0.9.12[${PYTHON_USEDEP}]
	dev-python/pymongo[${PYTHON_USEDEP}]
	=dev-python/redis-py-2.7.6[${PYTHON_USEDEP}]
	dev-python/pyrax[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	"

python_install() {
	distutils-r1_python_install

	keepdir /var/log/margarine

	keepdir /etc/margarine
	insinto /etc/margarine
	doins conf/margarine.ini
	doins conf/logging.ini
	doins conf/pyrax.ini
}

python_test() {
	nosetests || die
}
