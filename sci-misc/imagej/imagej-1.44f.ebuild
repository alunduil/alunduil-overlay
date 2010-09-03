# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2 eutils

MY_PV=${PV/./}
MY_PN="ij"
IJ_PV=`expr ${MY_PV::3} - 1`

DESCRIPTION="Image Processing and Analysis in Java"
HOMEPAGE="http://rsb.info.nih.gov/ij/"
SRC_URI="http://rsb.info.nih.gov/ij/download/src/${MY_PN}${MY_PV}-src.zip
	http://rsb.info.nih.gov/ij/images/ImageJ.png
	plugins? ( http://rsb.info.nih.gov/ij/download/zips/${MY_PN}${IJ_PV}.zip )"
RESTRICT="nomirror"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE="doc plugins debug"

RDEPEND=">=virtual/jre-1.4
	dev-java/java-config"
DEPEND=">=virtual/jdk-1.4
	dev-java/ant-core
	${RDEPEND}"

S=${WORKDIR}/source
IJ_S=${WORKDIR}/ImageJ

src_unpack() {
	cp "${DISTDIR}/ImageJ.png" "${WORKDIR}/${PN}.png"
	unpack ${A} || die "unpack failed"

	if ! use debug ; then
		sed -i 's: debug="on">: debug="off">:' "${S}/build.xml"
	fi
}

src_compile() {
	local antflags="build"
	use doc && antflags="${antflags} javadocs"
	ant ${antflags} || die  "ant build failed"
	cat <<EOF > "${T}/${PN}"
#!/bin/bash
IJ_LIB=/usr/share/${PN}/lib
if !([ "\${IJ_HOME}" ]) ; then
	IJ_HOME=\${HOME}
fi
if [ -d \${IJ_HOME}/plugins ] ; then
	IJ_PLG=\${IJ_HOME}
else
	IJ_PLG=/usr/share/${PN}/lib
fi
if !([ "\$IJ_MEM" ]) ; then
	IJ_MEM=128
fi
if !([ "\$IJ_CP" ]) ; then
	IJ_CP=\$(java-config -p imagej):\$(java-config -O)/lib/tools.jar
else
	IJ_CP=\$(java-config -p imagej):\$(java-config -O)/lib/tools.jar:\${IJ_CP}
fi
\$(java-config --java) \\
	-Xmx\${IJ_MEM}m -Dswing.aatext=true \\
	-Dawt.useSystemAAFontSettings=on\\
	-cp \${IJ_CP} \\
	-Duser.home=\${IJ_HOME} \\
	-Dplugins.dir=\${IJ_PLG} \\
	ij.ImageJ "\$@"
EOF
}

src_install() {
	java-pkg_dojar *.jar
	dobin "${T}/${PN}"
	if use plugins ; then
		cp -R "${IJ_S}/plugins" "${D}/usr/share/${PN}/lib/"
		cp -R "${IJ_S}/macros" "${D}/usr/share/${PN}/lib/"
	fi
	use doc && java-pkg_dohtml -r "${WORKDIR}/api"
	insinto /usr/share/pixmaps
	doins "${WORKDIR}/${PN}.png"
	make_desktop_entry imagej ImageJ "${PN}.png" Graphics
}

pkg_postinst() {
	einfo ""
	einfo "You can configure the path of a folder, which contains \"plugins\" directory and IJ_Prefs.txt,"
	einfo "by setting the environmental variable, \$IJ_HOME."
	einfo "Default setting is \$IJ_HOME=\${HOME}, i.e. \${HOME}/plugins and \${HOME}/IJ_Prefs.txt."
	einfo ""
	einfo "You can also configure the memory size by setting the environmental variable, \$IJ_MEM,"
	einfo "and the class path by setting the environmental variable, \$IJ_CP."
	einfo ""
	einfo "If you want to use more plugins, please see http://rsb.info.nih.gov/ij/plugins/index.html"
	einfo "and add *.class files to \$IJ_HOME/plugins folder"
	einfo ""
}
