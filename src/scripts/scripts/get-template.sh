#!/bin/sh

TEMPLATE_DIR="${HOME}/templates"
HERE="$(pwd)"

cd "${TEMPLATE_DIR}"
cp $(fzf) "${HERE}"

