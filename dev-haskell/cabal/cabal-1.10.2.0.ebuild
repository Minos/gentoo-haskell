# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.12

EAPI="3"

CABAL_FEATURES="bootstrap lib profile"
inherit haskell-cabal eutils

MY_PN="Cabal"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A framework for packaging Haskell software"
HOMEPAGE="http://www.haskell.org/cabal/"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE="doc"

DEPEND=">=dev-lang/ghc-6.10.1 <dev-lang/ghc-7.2"
RDEPEND="${DEPEND}
		virtual/pkgconfig"
# cabal uses dev-util/pkgconfig using runtime to resolve C dependencies, so
# repoman's RDEPEND.suspect QA does not apply here

S="${WORKDIR}/${MY_P}"

CABAL_CORE_LIB_GHC_PV="7.0.4"

src_configure() {
	if ! cabal-is-dummy-lib; then
		einfo "Bootstrapping Cabal..."
		$(ghc-getghc) -i -i. -i"${WORKDIR}/${FP_P}" -cpp --make Setup.hs \
			-o setup || die "compiling Setup.hs failed"
		cabal-configure
	fi
}

src_compile() {
	if ! cabal-is-dummy-lib; then
		cabal-build
	fi
}
