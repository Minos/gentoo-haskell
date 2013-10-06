# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="JuicyPixels"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Picture loading/serialization (in png, jpeg, bitmap, gif, tiff and radiance)"
HOMEPAGE="https://github.com/Twinside/Juicy.Pixels"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="mmap"

RDEPEND=">=dev-haskell/binary-0.6.4.0:=[profile?] <dev-haskell/binary-0.7.2:=[profile?]
	>=dev-haskell/deepseq-1.1:=[profile?] <dev-haskell/deepseq-1.4:=[profile?]
	>=dev-haskell/mtl-1.1:=[profile?] <dev-haskell/mtl-2.2:=[profile?]
	>=dev-haskell/primitive-0.5:=[profile?] <dev-haskell/primitive-0.6:=[profile?]
	>=dev-haskell/transformers-0.2.2:=[profile?] <dev-haskell/transformers-0.4:=[profile?]
	>=dev-haskell/vector-0.9:=[profile?] <dev-haskell/vector-0.11:=[profile?]
	>=dev-haskell/zlib-0.5.3.1:=[profile?] <dev-haskell/zlib-0.6:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	mmap? ( dev-haskell/mmap:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

S="${WORKDIR}/${MY_P}"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag mmap mmap)
}
