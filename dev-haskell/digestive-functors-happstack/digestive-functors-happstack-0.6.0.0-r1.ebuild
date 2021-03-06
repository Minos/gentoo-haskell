# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Happstack backend for the digestive-functors library"
HOMEPAGE="http://github.com/jaspervdj/digestive-functors"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-haskell/digestive-functors-0.6*:=[profile?]
		>=dev-haskell/happstack-server-6.0:=[profile?]
		<dev-haskell/happstack-server-7.4:=[profile?]
		>=dev-haskell/text-0.11:=[profile?]
		<dev-haskell/text-1.0:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

src_prepare() {
	cabal_chdeps \
		'happstack-server   >= 6.0  && < 7.2' 'happstack-server   >= 6.0  && < 7.4'
}
