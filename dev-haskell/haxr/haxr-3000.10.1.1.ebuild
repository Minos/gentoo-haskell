# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="XML-RPC client and server library."
HOMEPAGE="http://www.haskell.org/haskellwiki/HaXR"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/base64-bytestring:=[profile?]
	>=dev-haskell/blaze-builder-0.2:=[profile?] <dev-haskell/blaze-builder-0.4:=[profile?]
	>=dev-haskell/haxml-1.22:=[profile?] <dev-haskell/haxml-1.25:=[profile?]
	>=dev-haskell/http-4000:=[profile?]
	dev-haskell/mtl:=[profile?]
	<dev-haskell/network-3:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"
