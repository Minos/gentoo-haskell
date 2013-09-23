# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit base elisp-common haskell-cabal

DESCRIPTION="Happy Haskell Programming"
HOMEPAGE="http://www.mew.org/~kazu/proj/ghc-mod/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="emacs"

RDEPEND=">=dev-haskell/cabal-1.10:=[profile?]
	dev-haskell/convertible:=[profile?]
	dev-haskell/ghc-paths:=[profile?]
	dev-haskell/ghc-syb-utils:=[profile?]
	>=dev-haskell/hlint-1.7.1:=[profile?]
	dev-haskell/io-choice:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/transformers:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/doctest-0.9.3
		>=dev-haskell/hspec-1.7.1 )
"
SITEFILE=50${PN}-gentoo.el

PATCHES=("${FILESDIR}/${PN}-3.0.0-gentoo.patch")

src_compile() {
	haskell-cabal_src_compile
	if use emacs ; then
		pushd elisp
		elisp-compile *.el || die
		popd
	fi
}

src_install() {
	haskell-cabal_src_install
	if use emacs ; then
		pushd "${S}"
		elisp-install ghc-mod elisp/*.{el,elc}
		elisp-site-file-install "${FILESDIR}"/${SITEFILE}
		popd
	fi
}

pkg_postinst() {
	if use emacs ; then
		elisp-site-regen
		elog "To configure ghc-mod either add this one line to ~/.emacs:"
		elog "(add-hook 'haskell-mode-hook (lambda () (ghc-init)))"
		elog "or if you wish to use flymake, instead add this one line to ~/.emacs:"
		elog "(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))"
	fi
}

pkg_postrm() {
	if use emacs ; then
		elisp-site-regen
	fi
}
