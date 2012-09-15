# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="SELinux policy for Openstack Guest Agents"

KEYWORDS=""
IUSE=""

BASEPOL="9999"
POLICY_FILES="${PV}/${PN}.te ${PV}/${PN}.fc"

inherit selinux-policy-2
