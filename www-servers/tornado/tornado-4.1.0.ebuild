# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-servers/tornado/tornado-4.0.2.ebuild,v 1.4 2015/03/21 09:35:36 jer Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Tornado is a Python web framework and asynchronous networking library,…."
HOMEPAGE="http://www.tornadoweb.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV%.*}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="curl doc examples test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
	test? ( ${RDEPEND}
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7 pypy)
		$(python_gen_cond_dep 'dev-python/twisted-names[${PYTHON_USEDEP}]' python2_7)
		dev-python/service_identity[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	curl? ( $(python_gen_cond_dep 'dev-python/pycurl[${PYTHON_USEDEP}]' python2_7) )
	dev-python/certifi[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/backports-ssl-match-hostname[${PYTHON_USEDEP}]' python2_7 pypy)
"

python_compile_all() {
	use doc && emake -C docs
}

python_test() {
	"${PYTHON}" -m tornado.test.runtests || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )
	use examples && local EXAMPLES=( demos/. )

	distutils-r1_python_install_all
}
