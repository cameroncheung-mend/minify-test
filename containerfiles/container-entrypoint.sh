#!/bin/sh
# SPDX-License-Identifier: MIT
#
# Copyright (C) 2022 Olliver Schinagl <oliver@schinagl.nl>
#
# A beginning user should be able to docker run image bash (or sh) without
# needing to learn about --entrypoint
# https://github.com/docker-library/official-images#consistency

set -eu

CMD='minify'

# run command if it is not starting with a "-" and is an executable in PATH
if [ "${#}" -le 0 ] || \
   [ "${1#-}" != "${1}" ] || \
   [ -d "${1}" ] || \
   ! command -v "${1}" > '/dev/null' 2>&1; then
	bin="${CMD}"
fi

exec ${bin:+${bin}} "${@}"

exit 0
