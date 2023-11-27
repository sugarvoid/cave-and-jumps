#!/bin/sh
echo -ne '\033c\033]0;Get That Bit\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/get_that_bit.x86_64" "$@"
