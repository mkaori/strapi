#!/usr/bin/env bash

#
# https://gist.github.com/jonsuh/3c89c004888dfc7352be
# ----------------------------------
# Colors
# ----------------------------------
NO_COLOR='\033[0m'
B_GREEN='\033[1;32m'
B_RED='\033[1;31m'

function info() {
  printf "${B_GREEN}${@:1}${NO_COLOR}\n"
}

function debug() {
  printf "${@:1}\n"
}

function fCopy() {
  sD=$1
  tD=$2

  if [[ -d $tD ]]; then
    debug "remove folder: $tD"
    rm -rf $tD
  fi

  debug "copy data from [$sD] to [$tD]"
  cp -R $sD $tD
}

info "generate the package json file"
node index.js

fCopy ../strapi/lib ./lib
fCopy ../strapi/bin ./bin

debug "dry-run publish package: ${B_GREEN}npm publish --dry-run${NO_COLOR}"
# npm publish --dry-run

debug "mannually publish package by run command: ${B_GREEN}npm publish${NO_COLOR}"
