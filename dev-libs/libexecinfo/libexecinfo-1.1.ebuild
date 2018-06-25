# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib

DESCRIPTION="A library for inspecting program's backtrace"
HOMEPAGE="http://www.freebsdsoftware.org/devel/libexecinfo.html"
SRC_URI="mirror://freebsd/distfiles/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64-fbsd ~x86-fbsd"
IUSE=""

DEPEND="sys-freebsd/freebsd-mk-defs"
RDEPEND=""

PATCHES=( "${FILESDIR}/${P}-build.patch" )

src_prepare() {
	cp "${FILESDIR}/Makefile.linux" "${S}/"

	eapply_user
}

src_compile() {
	emake -f Makefile.linux
}
