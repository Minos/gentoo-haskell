# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
CABAL_FEATURES+=" nocabaldep" # HACK: does not work with cabal-1.18. Use ghc's one
inherit haskell-cabal

DESCRIPTION="Haskell binding for Qt Quick"
HOMEPAGE="http://www.gekkou.co.uk/software/hsqml/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+threadedtestsuite usepkgconfig"

RDEPEND=">=dev-haskell/network-2.3:=[profile?] <dev-haskell/network-2.5:=[profile?]
	>=dev-haskell/tagged-0.4:=[profile?] <dev-haskell/tagged-0.8:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-0.12:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.4:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	dev-qt/qtdeclarative
	dev-qt/qtscript
	sys-devel/gcc[cxx]
"
DEPEND="${RDEPEND}
	dev-haskell/c2hs
	>=dev-haskell/cabal-1.10
	virtual/pkgconfig
	test? ( >=dev-haskell/quickcheck-2.4 <dev-haskell/quickcheck-2.7 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag threadedtestsuite threadedtestsuite) \
		$(cabal_flag usepkgconfig usepkgconfig)
}
