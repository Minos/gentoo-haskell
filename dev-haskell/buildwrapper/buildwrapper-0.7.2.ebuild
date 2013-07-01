# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A library and an executable that provide an easy API for a Haskell IDE"
HOMEPAGE="https://github.com/JPMoresmau/BuildWrapper"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

RESTRICT="test" # requires strange stuff
LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/aeson-0.4:=[profile?]
		dev-haskell/attoparsec:=[profile?]
		dev-haskell/buildwrapper:=[profile?]
		dev-haskell/cabal:=[profile?]
		dev-haskell/cmdargs:=[profile?]
		dev-haskell/cpphs:=[profile?]
		dev-haskell/deepseq:=[profile?]
		dev-haskell/ghc-paths:=[profile?]
		dev-haskell/haskell-src-exts:=[profile?]
		dev-haskell/mtl:=[profile?]
		dev-haskell/regex-tdfa:=[profile?]
		dev-haskell/syb:=[profile?]
		dev-haskell/text:=[profile?]
		dev-haskell/transformers:=[profile?]
		dev-haskell/unordered-containers:=[profile?]
		dev-haskell/utf8-string:=[profile?]
		>=dev-haskell/vector-0.8:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >dev-haskell/htf-0.9
			dev-haskell/hunit
		)"

src_prepare(){
	epatch "${FILESDIR}"/${P}-haddock.patch
}
