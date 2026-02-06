#!/usr/bin/env bash
# shellcheck disable=SC2034

function config_m68k() {
    TARGET="m68k-unknown-linux-gnu"
    # shellcheck disable=SC2034
    LINUX_ARCH="m68k"

    local VERSION="$1"
    local TAR_OR_GIT="$2"

    setup_default_config

    BINUTILS_CONFIGURATION=(
        "${BINUTILS_BASE_CONFIG[@]}"
        "--with-arch=68020"
        "--disable-multilib"
    )

    GCC_CONFIGURATION=(
        "${GCC_BASE_CONFIG[@]}"
        "--disable-multilib"
    )

    GLIBC_CONFIGURATION=(
        "${GLIBC_BASE_CONFIG[@]}"
        "--with-arch=68020"
        "--with-fpu=68881"
        "--disable-multilib"
    )

    GDB_CONFIGURATION=(
        "${GDB_BASE_CONFIG[@]}"
    )

    type -t "setup_variables_${TAR_OR_GIT}_${VERSION}" > /dev/null || die "No setup_variables_${TAR_OR_GIT}_${VERSION} found!"
    "setup_variables_${TAR_OR_GIT}_${VERSION}"

    setup_linux_default_downloadfuncs
    setup_linux_default_buildfuncs
}
