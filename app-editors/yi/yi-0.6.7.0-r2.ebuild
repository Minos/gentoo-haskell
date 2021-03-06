# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

GTK_MAJ_VER="2"

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="The Haskell-Scriptable Editor"
HOMEPAGE="http://haskell.org/haskellwiki/Yi"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="gtk testing vte +vty"
# scion temporary dropped

RDEPEND=">=dev-haskell/binary-0.5:=[profile?]
		>=dev-haskell/cabal-1.10:=[profile?] <dev-haskell/cabal-1.20:=[profile?]
		>=dev-haskell/cautious-file-1.0.1:=[profile?]
		=dev-haskell/concrete-typerep-0.1*:=[profile?]
		>=dev-haskell/data-accessor-0.2.1.4:=[profile?]
		<dev-haskell/data-accessor-0.3:=[profile?]
		=dev-haskell/data-accessor-mtl-0.2*:=[profile?]
		>=dev-haskell/data-accessor-template-0.2.1.3:=[profile?]
		<dev-haskell/data-accessor-template-0.2.2:=[profile?]
		>=dev-haskell/derive-2.4:=[profile?]
		<dev-haskell/derive-2.7:=[profile?]
		>=dev-haskell/diff-0.1:=[profile?]
		<dev-haskell/diff-0.4:=[profile?]
		>=dev-haskell/dlist-0.4.1:=[profile?]
		>=dev-haskell/dyre-0.8.11:=[profile?]
		>=dev-haskell/fingertree-0:=[profile?]
		<dev-haskell/fingertree-0.2:=[profile?]
		>=dev-haskell/hashable-1.1:=[profile?]
		<dev-haskell/hashable-1.3:=[profile?]
		>dev-haskell/hint-0.3.1:=[profile?]
		>=dev-haskell/mtl-0.1.0.1:=[profile?]
		>=dev-haskell/pointedlist-0.4:=[profile?]
		<dev-haskell/pointedlist-0.6:=[profile?]
		dev-haskell/random:=[profile?]
		=dev-haskell/regex-base-0.93*:=[profile?]
		=dev-haskell/regex-tdfa-1.1*:=[profile?]
		>=dev-haskell/split-0.1:=[profile?]
		<dev-haskell/split-0.3:=[profile?]
		dev-haskell/uniplate:=[profile?]
		>=dev-haskell/unix-compat-0.1:=[profile?]
		<dev-haskell/unix-compat-0.5:=[profile?]
		>=dev-haskell/unordered-containers-0.1.3:=[profile?]
		<dev-haskell/unordered-containers-0.3:=[profile?]
		>=dev-haskell/utf8-string-0.3.1:=[profile?]
		>=dev-haskell/xdg-basedir-0.2.1:=[profile?]
		<dev-haskell/xdg-basedir-0.3:=[profile?]
		>=dev-lang/ghc-6.12.1:=
		gtk? ( =dev-haskell/glib-0.12*:${GTK_MAJ_VER}=
			=dev-haskell/gtk-0.12*:${GTK_MAJ_VER}=
			=dev-haskell/pango-0.12*:${GTK_MAJ_VER}=
		)
		testing? ( >=dev-haskell/quickcheck-2.1.0.2:=[profile?]
		)
		vte? ( dev-haskell/executable-path:=[profile?]
			=dev-haskell/vte-0.12*:=[profile?]
			=dev-haskell/glib-0.12*:${GTK_MAJ_VER}=
			=dev-haskell/gtk-0.12*:${GTK_MAJ_VER}=
			=dev-haskell/pango-0.12*:${GTK_MAJ_VER}=
		)
		vty? ( <dev-haskell/vty-5:=[profile?]
			>=dev-haskell/vty-4.7.0.0:=[profile?]
		)
		"
DEPEND="${RDEPEND}
		dev-haskell/alex
		>=dev-haskell/cabal-1.10"

src_prepare() {
	epatch "${FILESDIR}"/${P}-vte.patch
	cabal_chdeps \
		'Diff >=0.1 && <0.3' 'Diff >=0.1 && <0.4' \
		'fingertree >= 0 && <0.1' 'fingertree >= 0 && <0.2' \
		'Cabal >= 1.10 && < 1.18' 'Cabal >= 1.10 && < 1.20' \
		'alex >= 3.0.3 && <= 3.0.5' 'alex >= 3.0.3 && <= 3.2'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag gtk pango) \
		$(cabal_flag testing testing) \
		$(cabal_flag vte vte) \
		$(cabal_flag vty vty)

	use gtk || use vty || use vte || ewarn "${PN} requires either USE=gtk or USE=vty or USE=vte to build a user interface."
}
