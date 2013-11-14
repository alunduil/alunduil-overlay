# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1

DESCRIPTION="Provisioning salted minions to various cloud providers"
HOMEPAGE="http://saltstack.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	app-admin/salt
	dev-python/pyyaml
	dev-python/libcloud
	net-misc/sshpass
	"

python_install() {
	distutils-r1_python_install "${@}"

	keepdir /etc/salt
	insinto /etc/salt

	doins conf/cloud
	doins conf/cloud.profiles

	keepdir /etc/salt/cloud.profiles.d
	insinto /etc/salt/cloud.profiles.d

	newins conf/EC2-us-east-1.profiles EC2-us-east-1.conf
	newins conf/EC2-us-west-1.profiles EC2-us-west-1.conf
	newins conf/EC2-us-west-2.profiles EC2-us-west-2.conf
}
