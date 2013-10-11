# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile"
inherit haskell-cabal eutils elisp-common darcs

MY_PN="Agda"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A dependently typed functional programming language and proof assistant"
HOMEPAGE="http://wiki.portal.chalmers.se/agda/"
EDARCS_REPOSITORY="http://code.haskell.org/Agda"
EDARCS_GET_CMD="get --verbose"
EDARCS_LOCALREPO="Agda2"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS=""
IUSE="epic +stdlib"

RDEPEND=">=dev-haskell/binary-0.4.4:=[profile?]
		<dev-haskell/binary-0.8:=[profile?]
		=dev-haskell/deepseq-1.3*:=[profile?]
		epic? ( dev-lang/epic:=[profile?] )
		>=dev-haskell/geniplate-0.6.0.3:=[profile?]
		<dev-haskell/geniplate-0.7:=[profile?]
		>=dev-haskell/hashable-1.1.2.3:=[profile?]
		<dev-haskell/hashable-1.3:=[profile?]
		>=dev-haskell/hashtables-1.0:=[profile?]
		<dev-haskell/hashtables-1.2:=[profile?]
		>=dev-haskell/haskeline-0.6.3.2:=[profile?]
		<dev-haskell/haskeline-0.8:=[profile?]
		>=dev-haskell/haskell-src-exts-1.9.6:=[profile?]
		<dev-haskell/haskell-src-exts-1.15:=[profile?]
		>=dev-haskell/mtl-2.0:=[profile?]
		<dev-haskell/mtl-2.2:=[profile?]
		<dev-haskell/parallel-3.3:=[profile?]
		>=dev-haskell/quickcheck-2.3:=[profile?]
		<dev-haskell/quickcheck-2.6:=[profile?]
		=dev-haskell/text-0.11*:=[profile?]
		=dev-haskell/unordered-containers-0.2*:=[profile?]
		=dev-haskell/xhtml-3000.2*:=[profile?]
		>=dev-haskell/zlib-0.4.0.1:=[profile?]
		<dev-haskell/zlib-0.6:=[profile?]
		>=dev-lang/ghc-6.12.1:=
		virtual/emacs
		app-emacs/haskell-mode"
PDEPEND="stdlib? ( sci-mathematics/agda-stdlib )"
DEPEND="${RDEPEND}
		dev-haskell/alex
		>=dev-haskell/cabal-1.8
		dev-haskell/happy"

SITEFILE="50${PN}2-gentoo.el"
S="${WORKDIR}/${P}"

src_prepare() {
	CABAL_FILE=${MY_PN}.cabal cabal_chdeps \
		'binary >= 0.4.4 && < 0.6' 'binary >= 0.4.4 && < 0.8'
	sed -e '/.*emacs-mode.*$/d' \
		-e '/^executable agda/,$d' \
		-i "${S}/${MY_PN}.cabal" \
		|| die "Could not remove agda and agda-mode from ${MY_PN}.cabal"
	cabal-mksetup
	if use epic && use stdlib; then
		ewarn "Note that the agda-stdlib README:"
		ewarn "http://www.cse.chalmers.se/~nad/listings/lib/README.html"
		ewarn 'says: "Currently the library does not support the Epic or JavaScript compiler'
		ewarn 'backends." Hence you may wish to remove the epic use flag if you wish to use'
		ewarn "the Agda standard library."
	fi
	sed -e 's@-Werror@@g' \
		-i "${S}/${MY_PN}.cabal" \
		-i "${S}/mk/config.mk.in" \
		-i "${S}/src/prototyping/eval/Makefile" \
		-i "${S}/src/prototyping/nameless/Makefile" \
		-i "${S}/src/rts/${PN}-rts.cabal" \
		|| die "sed to remove -Werror failed"
	sed -e '/, "-Werror"/d' \
		-i "${S}/src/full/Agda/Compiler/MAlonzo/Compiler.hs" \
		|| die "sed to remove -Werror from Compiler.hs failed"
}

src_configure() {
	cabal_src_configure $(cabal_flag epic)
}

src_compile() {
	elisp-compile src/data/emacs-mode/*.el \
		|| die "Failed to compile emacs mode"
	haskell-cabal_src_compile
}

src_install() {
	haskell-cabal_src_install
	elisp-install ${PN} src/data/emacs-mode/*.el \
		|| die "Failed to install emacs mode"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "Failed to install elisp site file"
}

pkg_postinst() {
	ghc-package_pkg_postinst
	elisp-site-regen
}

pkg_postrm() {
	ghc-package_pkg_prerm
	elisp-site-regen
}
