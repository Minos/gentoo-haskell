#!/usr/bin/env bash

#
# The script is intended to build latest yet unkeyworded ghc for given $ARCH.
#
# It is quite heavyweight and works as follows:
#   - download latest stage3
#   - unpack stage3
#   - chroot there
#   - [in chroot] install latest stable ghc with USE=binary
#   - [in chroot] install latest unkeyworded ghc with USE=ghcbootstrap and --buildpkg
#   - move final binary or reported errors to known location
#

# example for x86:
#  path/to/refresh-ghc-bin.bash --target-arch=x86 --stage3-url=http://distfiles.gentoo.org/releases/x86/autobuilds/latest-stage3-i686.txt

# to make reports more readable
# en_GB.UTF-8 might be better
# but it would require locale regen
export LANG=C

die() {
    echo "ERROR: $@"
    exit 1
}

i() {
    echo "$@"
}

run() {
    echo "RUN $@"
    "$@" || die "failed to run '$@'"
}

# gentoo arch, like x86, alpha
target_arch=
# pointer to .txt files on gentoo mirrors:
#    http://distfiles.gentoo.org/releases/x86/autobuilds/latest-stage3-i686.txt
stage3_url=
# if you happen to need hardened here
# you might like to use '--chroot-profile=hardened/linux/amd64'
chroot_profile=1
needed_atom="dev-lang/ghc"

while [[ ${#@} -gt 0 ]]; do
    case "$1" in
        --target-arch=*)
            target_arch=${1#--target-arch=}
            ;;
        --stage3-url=*)
            stage3_url=${1#--stage3-url=}
            ;;
        --chroot-profile=*)
            chroot_profile=${1#--chroot-profile=}
            ;;
        *)
            die "unknown option: $1"
            ;;
    esac
    # parsed fine
    shift
done

[[ -z ${target_arch} ]] && target_arch=$(portageq envvar ARCH)
[[ -z ${stage3_url} ]] && stage3_url=http://distfiles.gentoo.org/releases/${target_arch}/autobuilds/latest-stage3-${target_arch}.txt

i "target ARCH:     ${target_arch}"
i "stage3 URL:      ${stage3_url}"
i "chroot profile:  ${chroot_profile}"

relative_stage3_bz2=$(wget "${stage3_url}" -O - | fgrep .tar.bz2)
full_stage3_bz2=$(dirname "${stage3_url}")/${relative_stage3_bz2}
stage3_name=$(basename "${full_stage3_bz2}")

run wget -c "${full_stage3_bz2}"

chroot_temp=__ghc_chroot_$(date "+%F-%H-%M-%S")
chroot_subdir=gentoo-${target_arch}
chroot_script=${chroot_subdir}.sh
chroot_bits=as-is
ghc_autobuilds_dir=ghc-autobuilds/${target_arch}/$(date "+%F-%H-%M-%S")

run mkdir -p "${ghc_autobuilds_dir}"
# make it absolute to be agnostic to chdirs
ghc_autobuilds_dir=$(realpath "${ghc_autobuilds_dir}")

run mkdir "${chroot_temp}"
(
    run cd "${chroot_temp}"
    run mkdir "${chroot_subdir}"
    (
        run cd "${chroot_subdir}"
        run tar -xjf ../../"${stage3_name}"

        cat >init-portage-env.bash <<-EOF
	echo 'source /bound/conf/make.conf' >> /etc/portage/make.conf
	eselect profile set ${chroot_profile}
	EOF

        cat >refresh-ghc.bash <<-EOF
	echo "Installing stable binary ghc"
	USE="binary ${USE}"                            emerge --verbose --oneshot dev-lang/ghc || exit 1
	echo "Building pkg '${needed_atom}'"
	mkdir -p /etc/portage/package.accept_keywords
	echo "${needed_atom} ~${target_arch} **" > /etc/portage/package.accept_keywords/ghc
	mkdir -p /etc/portage/package.use
	echo "${needed_atom} -binary doc ghcbootstrap ghcmakebinary llvm ${USE}" > /etc/portage/package.use/ghc
	FEATURES="${FEATURES} -test -strict -stricter" emerge --verbose --onlydeps   "${needed_atom}"
	                                               emerge --verbose --buildpkg=y "${needed_atom}"
	EOF

        cat >store-results.bash <<-EOF
	for f in \$(find \$(portageq envvar PORTAGE_TMPDIR) -type f -name build.log)
	do
	    cp -v -- "\$f" "/bound/result/\${f//\//_}"
	done
	for f in \$(find \$(portageq envvar PKGDIR) -type f -name '*.tbz2')
	do
	    cp -v -- "\$f" "/bound/result/\${f//\//_}"
	done
	EOF
    )
    run git clone git://github.com/trofi/gentoo-chrootiez.git
    (
        run cd gentoo-chrootiez/bound
        run ./make_typical_binds.sh
        run ./make_typical_confs.sh
        run ln -s "${ghc_autobuilds_dir}" result
    )

    cat >"${chroot_script}" <<-EOF
	gentoo-chrootiez/scripts/run_chroot.sh ${chroot_subdir} ${chroot_bits} "\$@"
	EOF

    run bash "${chroot_script}" '/init-portage-env.bash'
    run bash "${chroot_script}" '/refresh-ghc.bash'
    run bash "${chroot_script}" '/store-results.bash'
)

echo "cleanup '${chroot_temp}'"
rm -rf -- "${chroot_temp}"
