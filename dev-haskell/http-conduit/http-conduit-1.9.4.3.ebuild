# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="HTTP client package with conduit interface and HTTPS support."
HOMEPAGE="http://www.yesodweb.com/book/http-conduit"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/asn1-data-0.5.1:=[profile?]
	>=dev-haskell/base64-bytestring-0.1:=[profile?]
	>=dev-haskell/blaze-builder-0.2.1:=[profile?]
	>=dev-haskell/blaze-builder-conduit-0.5:=[profile?]
	>=dev-haskell/case-insensitive-0.2:=[profile?]
	>=dev-haskell/certificate-1.3:=[profile?]
	>=dev-lang/ghc-6.12.1:=
	>=dev-haskell/conduit-0.5.5:=[profile?] <dev-haskell/conduit-1.1:=[profile?]
	>=dev-haskell/cookie-0.4:=[profile?]
	>=dev-haskell/cprng-aes-0.3:=[profile?]
	dev-haskell/data-default:=[profile?]
	dev-haskell/deepseq:=[profile?]
	>=dev-haskell/failure-0.1:=[profile?]
	>=dev-haskell/http-types-0.7:=[profile?]
	>=dev-haskell/lifted-base-0.1:=[profile?]
	>=dev-haskell/mime-types-0.1:=[profile?]
	>=dev-haskell/monad-control-0.3:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/publicsuffixlist-0.0.3:=[profile?] <dev-haskell/publicsuffixlist-1.0:=[profile?]
	dev-haskell/random:=[profile?]
	dev-haskell/regex-compat:=[profile?]
	>=dev-haskell/resourcet-0.3:=[profile?] <dev-haskell/resourcet-0.5:=[profile?]
	>=dev-haskell/socks-0.4:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/tls-1.1.0:=[profile?]
	>=dev-haskell/tls-extra-0.5.0:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?]
	>=dev-haskell/transformers-base-0.4:=[profile?]
	>=dev-haskell/utf8-string-0.3.4:=[profile?]
	>=dev-haskell/void-0.5.5:=[profile?]
	>=dev-haskell/zlib-conduit-0.5:=[profile?] <dev-haskell/zlib-conduit-1.1:=[profile?]
	>=dev-haskell/network-2.3:=[profile?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	network-bytestring? ( test? ( dev-haskell/conduit
					>=dev-haskell/hspec-1.3
					dev-haskell/hunit
					dev-haskell/network
					>=dev-haskell/network-conduit-0.6
					dev-haskell/publicsuffixlist
					dev-haskell/resourcet
					dev-haskell/wai
					>=dev-haskell/warp-1.3.6
					dev-haskell/zlib-conduit ) )
	!network-bytestring? ( test? ( dev-haskell/conduit
					>=dev-haskell/hspec-1.3
					dev-haskell/hunit
					>=dev-haskell/network-conduit-0.6
					dev-haskell/publicsuffixlist
					dev-haskell/resourcet
					dev-haskell/wai
					>=dev-haskell/warp-1.3.6
					dev-haskell/zlib-conduit ) )
"
