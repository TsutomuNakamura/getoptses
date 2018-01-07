# getoptses
getoptses is a getopt(GNU/Linux) limited implementation by using getopts(bash builtin).
It implements only frequently used options such as "-o|--option", "-l|--longoptions" in getopt and enabling parsing options with usability of getopt.
Of course, it can use only in bash because of getopts is bash builtin.

# Usage
Clone this repository and copy getoptses.sh in your arbitrary location as needed then load it in your session.

```bash
$ git clone https://github.com/TsutomuNakamura/getoptses.git
$ cp getoptses/getoptses.sh /path/to/getoptses/
$ . /path/to/getoptses/getoptses.sh
```

Or you can load it directly.
```bash
$ . <(curl -Sso- https://raw.githubusercontent.com/TsutomuNakamura/getoptses/master/getoptses.sh)
```

# Examples
You can use getoptses that has "-o|--option", "-l|--longoptions" like getopt(GNU/Linux) after load getoptses.sh.

```shell-script
#!/bin/bash

function main() {
    . /path/to/getoptses/getoptses.sh

    local options
    options=$(getoptses -o "ab:" --longoptions "long-a,long-b:,lonb-c" -- "$@")
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
```

# License
This software is released under the MIT License, see LICENSE.txt.
