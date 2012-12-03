# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit distutils vcs-snapshot

DESCRIPTION="Python web-scraping library that wraps urllib2 and BeautifulSoup"
HOMEPAGE="https://github.com/adregner/beautifulscraper"
SRC_URI="https://github.com/adregner/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=">=dev-python/beautifulsoup-4"
