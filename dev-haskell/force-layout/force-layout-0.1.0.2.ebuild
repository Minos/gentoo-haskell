# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Simple force-directed layout"
HOMEPAGE="http://hackage.haskell.org/package/force-layout"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/fclabels-1.0:=[profile?]
		<dev-haskell/fclabels-1.2:=[profile?]
		=dev-haskell/newtype-0.2*:=[profile?]
		>=dev-haskell/vector-space-0.7:=[profile?]
		<dev-haskell/vector-space-0.9:=[profile?]
		>=dev-haskell/vector-space-points-0.1.1:=[profile?]
		<dev-haskell/vector-space-points-0.2:=[profile?]
		>=dev-lang/ghc-7.0.1:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.10"