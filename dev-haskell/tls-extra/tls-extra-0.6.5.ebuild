# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="TLS extra default values and helpers"
HOMEPAGE="http://github.com/vincenthz/hs-tls"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"
RESTRICT="test"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-haskell/certificate-1.3.5:=[profile?] <dev-haskell/certificate-1.4.0:=[profile?]
	>=dev-haskell/cipher-aes-0.2:=[profile?] <dev-haskell/cipher-aes-0.3:=[profile?]
	dev-haskell/cipher-rc4:=[profile?]
	>=dev-haskell/crypto-pubkey-0.2.0:=[profile?]
	dev-haskell/crypto-random:=[profile?]
	>=dev-haskell/cryptohash-0.6:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/network-2.3:=[profile?]
	>=dev-haskell/pem-0.1.0:=[profile?] <dev-haskell/pem-0.2.0:=[profile?]
	>=dev-haskell/tls-1.1.0:=[profile?] <dev-haskell/tls-1.2.0:=[profile?]
	dev-haskell/vector:=[profile?]
	>=dev-lang/ghc-6.12.1:=
	test? ( >=dev-haskell/cprng-aes-0.5.0:=[profile?]
		dev-haskell/hunit:=[profile?]
		>=dev-haskell/quickcheck-2:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test test)
}
