# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="SELinux policy for singularity"

KEYWORDS=""
IUSE=""

MODS="singularity"
BASEPOL="9999"
POLICY_FILES="${FILESDIR}/${PV}/${PN}.{te,fc}"

inherit selinux-policy-2
