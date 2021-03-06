# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Backend for rendering diagrams directly to GTK windows"
HOMEPAGE="http://projects.haskell.org/diagrams/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/diagrams-cairo-0.6:=[profile?] <dev-haskell/diagrams-cairo-0.8:=[profile?]
	>=dev-haskell/diagrams-lib-0.6:=[profile?] <dev-haskell/diagrams-lib-0.8:=[profile?]
	>=dev-haskell/gtk-0.12.0:=[profile?] <dev-haskell/gtk-0.13:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"
