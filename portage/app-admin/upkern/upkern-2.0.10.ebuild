# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Automated Gentoo kernel updater."
HOMEPAGE="http://www.alunduil.com/programs/upkern/"
SRC_URI="http://www.alunduil.com/svn/distfiles/upkern/${P}.tar.bz2"

# Remove this when added to the portage tree:
RESTRICT="test"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86 ~sparc"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND} \
	sys-kernel/module-rebuild"

src_install()
{
	distutils_src_install

	#dodoc ChangeLog README TODO || die "dodoc failed"
	dodoc ChangeLog || die "dodoc failed"
	#doman man/*.8 || die "doman failed"
}
