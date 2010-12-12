# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Use your Android phone as a wireless webcam"
HOMEPAGE="http://www.dev47apps.com/"
SRC_URI="http://www.dev47apps.com/files/droidcam.tar.gz"

LICENSE=""

SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

MODULE_NAMES="droidcam_v4l(drivers/media/video:${S}/driver:${S}/driver)"

src_compile() {
	cd "${S}"/src
	emake droidcam || die "emake droidcam failed"
	cd "${S}"/driver
	ARCH=$(uname -m)
	emake -C "${KV_OUT_DIR}" M=`pwd` || die "emake kernel module failed"
}

src_install() {
	linux-mod_src_install
	dobin src/droidcam
}

pkg_postinst() {
	elog "Please use \"modprobe droidcam_v4l\" to load the module,"
	elog "then start droidcam on your PC and DroidCam Wireless Webcam on your phone."
}
