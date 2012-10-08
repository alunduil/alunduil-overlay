# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="SELinux policy for Openstack Guest Agents"

KEYWORDS="amd64"
IUSE="xen"

MODS="openstackguestagent"
BASEPOL="${PVR}"
POLICY_FILES="${PV}/${MODS}.te ${PV}/${MODS}.fc"

inherit selinux-policy-2

DEPEND="xen? ( sec-policy/selinux-xen )"
RDEPEND="${DEPEND}"
