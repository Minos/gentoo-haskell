# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A space-efficient set data structure."
HOMEPAGE="http://hackage.haskell.org/package/bitset"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/deepseq-1.3:=[profile?] <dev-haskell/deepseq-1.4:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	dev-libs/gmp
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.12
	test? ( >=dev-haskell/quickcheck-2.5 <dev-haskell/quickcheck-2.7
		>=dev-haskell/test-framework-0.6 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-quickcheck2-0.2 <dev-haskell/test-framework-quickcheck2-0.4 )
"
src_prepare() {
	cabal_chdeps \
	  'QuickCheck                 == 2.5.*' 'QuickCheck >= 2.5 && < 2.7' \
	  'test-framework             == 0.6.*' 'test-framework >= 0.6 && < 0.9' \
	  'test-framework-quickcheck2 == 0.2.*' 'test-framework-quickcheck2 >= 0.2 && < 0.4'
}
