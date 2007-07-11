# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod versionator

DESCRIPTION="Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
HOMEPAGE="http://www.open-iscsi.org/"

# Need to replace the '.' in the name with a '-' for downloading purposes.
MY_P="$(replace_version_separator 2 '-')"
MY_P="${PN}-${MY_P}"

S="${WORKDIR}/${MY_P}"

SRC_URI="http://www.open-iscsi.org/bits/${MY_P}.tar.gz"

# Remove this when added to the portage tree:
RESTRICT="test"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="doc debug"

DEPEND=""
RDEPEND="!sys-block/iscsi-initiator-core-tools\
	sys-libs/glibc*"

crc32c_check()
{
	ebegin "Checking for CRC32C support..."
	linux_chkconfig_present CRC32C
	eend $?

	if [[ $? -ne 0 ]]; then
		eerror "This version needs CRC32C support!"
		eerror "Please enable CRC32C support in your kernel config, found at:"
		eerror
		eerror "  Cryptographic options -->"
		eerror "    CRC32c CRC algorithm"
		eerror
		eerror "and recompile your kernel..."
		die "CRC32C support not detected"
	fi
}

pkg_setup()
{
	ebegin "checking if the kernel sources are newer than 2.6.16..."

	KV_MAJOR=$(echo ${KV} | gawk -F . '{print $1}')
	KV_MINOR=$(echo ${KV} | gawk -F . '{print $2}')
	KV_PATCH=$(echo ${KV} | gawk -F . '{print $3}' | gawk -F - '{print $1}')

	(( ${KV_MAJOR} >= 2 )) || \
	(( ${KV_MINOR} >= 6 )) || \
	if (( ${KV_PATCH} >= 16 )); then
		eend 1
		eerror "this package requires a 2.6.16 or newer kernel to build properly."
		die "kernel source check failed"
	fi
	eend 0

	crc32c_check
}

src_unpack()
{
	unpack ${A}
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

src_compile()
{
	use debug && append-flags -DDEBUG_TCP -DDEBUG_SCSI
	use amd64 && export ARCH="x86_64"
	cd ${S}/kernel
	linux-mod_src_compile || die "module build failed"
	cd ${S}/usr
	emake DESTDIR=${D} || die "emake usr failed"
	cd ${S}/utils
	emake DESTDIR=${D} || die "emake utils failed"
	cd ${S}/utils/fwparam_ibft
	emake DESTDIR=${D} || die "emake fwparam_ibft failed"
}

src_install()
{
	cd ${S}/kernel
	linux-mod_src_install || die "module install failed"
	cd ${S}
	dosbin usr/iscsid usr/iscsiadm usr/iscsistart
	newinitd "${FILESDIR}"/open-iscsi-2.0.865.4.init iscsid
	newconfd "${FILESDIR}"/open-iscsi-2.0.865.4.init-conf iscsid
	doman doc/*.8
	keepdir /etc/iscsi/
	insinto /etc/iscsi/
	newins "${FILESDIR}"/open-iscsi-2.0.865.4.conf iscsid.conf.sample
	newins "${FILESDIR}"/open-iscsi-2.0.865.4.conf iscsid.conf
	newins "${FILESDIR}"/open-iscsi-2.0.865.4.initiatorname initiatorname.iscsi
	if use doc; then
		dodoc README THANKS
		docinto test
		dodoc test/*
	fi
	keepdir /var/db/iscsi
	fperms 700 /var/db/iscsi
	fperms 600 /etc/iscsi/iscsid.conf.sample
	fperms 600 /etc/iscsi/iscsid.conf
}

pkg_postinst()
{
	linux-mod_pkg_postinst
}
