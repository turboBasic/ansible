#!/usr/bin/env bash

main() {
    # shellcheck disable=SC2155

    local SCRIPT_DIR=$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )
    echo "SCRIPT_DIR: ${SCRIPT_DIR}"

    sudo rsync --archive --verbose "${SCRIPT_DIR}"/ansible/etc/ansible/ /etc/ansible
}


# shellcheck disable=SC2034
if [ -n "$ZSH_EVAL_CONTEXT" ]; then
    echo "ERROR: This script should be executed by bash shell. Current shell is identified as 'zsh'"
    case $ZSH_EVAL_CONTEXT in
        *:file)
            (sourced=1)
            return 1
        ;;
    esac
    exit 1
elif [ -n "$BASH_VERSION" ]; then
    if (return 0 2>/dev/null); then
        (sourced=1)
    fi
    main "$@"
    unset -f main
else # All other shells: examine $0 for known shell binary filenames
    # Detects `sh` and `dash`; add additional shell filenames as needed.
    echo "ERROR: This script should be executed by bash shell! Current shell is identified as '${0##*/}'"
    case ${0##*/} in
        sh|dash)
            (sourced=1)
            return 1
        ;;
    esac
    exit 1
fi
