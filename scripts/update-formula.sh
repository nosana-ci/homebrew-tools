#!/usr/bin/env bash

# exit upon failure
set -e

# setup
[[ -n "${DEBUG_SCRIPT}" ]] && set -xv

# shell swag
RED="\033[1;91m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
WHITE="\033[1;38;5;231m"
RESET="\n\033[0m"

# logging
log_std() { echo -e "${CYAN}==> ${WHITE}${1}${RESET}"; }
log_err() { echo -e "${RED}==> ${WHITE}${1}${RESET}"; }

formula="${1}"
version="${2}"
sha="${3}"

log_std "Formula is ${GREEN}${formula}"
log_std "Version is ${GREEN}${version}"
log_std "Sha is ${GREEN}${sha}"

[[ -z "${formula}" ]] && exit 1
[[ -z "${version}" ]] && exit 1
[[ -z "${sha}" ]] && exit 1


sed -E -i \
  -e "s/v[0-9]+.[0-9]+.[0-9]+/${version}/g" \
  -e "s/sha256 \"[0-9a-z]+\"/sha256 \"${sha}\"/" \
  "Formula/${formula}"
