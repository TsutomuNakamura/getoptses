#!/bin/bash

function main() {
    local scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    . "${scriptdir}/../getoptses.sh"

    local options
    options=$(getoptses -o "ab:" --longoptions "long-a,long-b:,lonb-c" -- "$@")
    #options=$(getopt -o "ab:" --longoptions "long-a,long-b:,lonb-c" -- "$@")
    if [[ "$?" -ne 0 ]]; then
        echo "Invalid option were specified" >&2
        return 1
    fi
    eval set -- "$options"

    while true; do
        case "$1" in
        -a | --long-a )
            echo "-a, --long-a"
            shift
            ;;
        -b | --long-b )
            echo "-b, --long-b: $2"
            shift 2
            ;;
        --long-c )
            echo "--long-c"
            shift
            ;;
        -- )
            shift
            break
            ;;
        * )
            echo "Internal error has occured" >&2
            return 1
            ;;
        esac
    done

    echo "args: $@"
    return 0
}

main "$@" || exit $?

