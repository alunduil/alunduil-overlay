# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdeplasma-addons"
WEBKIT_REQUIRED="always"
inherit kde4-base

DESCRIPTION="Extra Plasma applets and engines."
HOMEPAGE="http://www.kde.org/"
LICENSE="GPL-2 LGPL-2"

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug desktopglobe exif qalculate qwt rss scim semantic-desktop microblog"

# krunner is only needed to generate dbus interface for lancelot
COMMON_DEPEND="
	app-crypt/qca:2
	dev-libs/libattica
	$(add_kdebase_dep kdelibs 'semantic-desktop?')
	$(add_kdebase_dep krunner)
	$(add_kdebase_dep plasma-workspace 'rss?')
	x11-misc/shared-mime-info
	desktopglobe? ( $(add_kdebase_dep marble) )
	exif? ( $(add_kdebase_dep libkexiv2) )
	qalculate? ( sci-libs/libqalculate )
	qwt? ( x11-libs/qwt:5 )
	rss? ( $(add_kdebase_dep kdepimlibs 'semantic-desktop') )
	scim? ( app-i18n/scim )
"
DEPEND="${COMMON_DEPEND}
	dev-cpp/eigen:2
"
# kde-misc/plasmaboard: moved here in 4.3.65
# kde-misc/qalculate-applet: since 4.4.0
RDEPEND="${COMMON_DEPEND}
	!kdeprefix? (
		!kde-misc/plasmaboard
		!kde-misc/qalculate-applet
	)
	microblog? ( app-crypt/qca-ossl )
"

# kdebase-data: some svg icons moved from data directly here.
add_blocker kdebase-data '<4.2.88'

PATCHES=(
	"${FILESDIR}/${PN}-4.4.74-cmake.patch"
	"${FILESDIR}/${PV}-fix_lancelot.patch"
)

src_prepare() {
	find "${S}" -name CMakeLists.txt | \
		xargs sed -i \
			-e 's/${KDE4WORKSPACE_PLASMACLOCK_LIBRARY}/plasmaclock/g' \
			-e 's/${KDE4WORKSPACE_WEATHERION_LIBRARY}/weather_ion/g' \
			-e 's/${KDE4WORKSPACE_TASKMANAGER_LIBRARY}/taskmanager/g' \
		|| die "Failed to patch CMake files"

	kde4-base_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DDBUS_INTERFACES_INSTALL_DIR="${EKDEDIR}/share/dbus-1/interfaces/"
		$(cmake-utils_use_with desktopglobe Marble)
		$(cmake-utils_use_with exif Kexiv2)
		$(cmake-utils_use_with qalculate)
		$(cmake-utils_use_with qwt)
		$(cmake-utils_use_with rss KdepimLibs)
		$(cmake-utils_use_with semantic-desktop Nepomuk)
		$(cmake-utils_use_with scim)
	)

	kde4-base_src_configure
}
