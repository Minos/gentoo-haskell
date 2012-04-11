# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Adjunctions"
HOMEPAGE="http://github.com/ekmett/adjunctions/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/comonad-1.1.1.3[profile?]
		<dev-haskell/comonad-1.2[profile?]
		=dev-haskell/comonad-transformers-2.1*[profile?]
		>=dev-haskell/contravariant-0.2.0.1[profile?]
		<dev-haskell/contravariant-0.3[profile?]
		>=dev-haskell/distributive-0.2.1[profile?]
		<dev-haskell/distributive-0.3[profile?]
		>=dev-haskell/keys-2.1.3[profile?]
		<dev-haskell/keys-2.2[profile?]
		=dev-haskell/mtl-2.1*[profile?]
		=dev-haskell/representable-functors-2.2*[profile?]
		=dev-haskell/semigroupoids-1.3*[profile?]
		=dev-haskell/transformers-0.3*[profile?]
		>=dev-haskell/void-0.5.5.1[profile?]
		<dev-haskell/void-0.6[profile?]
		>=dev-lang/ghc-7.0.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
