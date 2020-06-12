#!/usr/bin/env bash


set -E -o functrace


__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__NAME__="${__SOURCE__//*(*\/|.*)/}"
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"
__PARENT_DIR__="$(dirname "${__DIR__}")"
__AUTHOR__='S0AndS0'
__DESCRIPTION__=''
__USAGE_TIPS__=(
    '## Run via git-push-wh script'
    'git push-wh srv gh-pages'
    '## Or run with additional build arguments'
    "_BUILD_ARGS='--' git push-wh srv gh-pages"
)


## Provides: failure
source "${__PARENT_DIR__}/shared_functions/modules/trap-failure/failure.sh"
trap 'failure "LINENO" "BASH_LINENO" "${BASH_COMMAND}" "${?}"' ERR

## Provides: __license__ <description> <author>
source "${__PARENT_DIR__}/shared_functions/license.sh"

## Provides: __usage__ <message>
source "${__PARENT_DIR__}/shared_functions/post-push/usage.sh"

## Provides: git_host <remote>
source "${__PARENT_DIR__}/shared_functions/post-push/git_host.sh"

## Provides git_remote <args>
source "${__PARENT_DIR__}/shared_functions/post-push/git_remote.sh"

## Provides: git_repo <remote>
source "${__PARENT_DIR__}/shared_functions/post-push/git_repo.sh"


(("${#HELP}")) && {
    __usage__
    exit 0
}

(("${#LICENSE}")) && {
    __license__
    exit 0
}

_remote="$(git_remote "${@}")"
_host="$(git_host "${_remote}")"
_repo="$(git_repo "${_remote}")"


(("${VERBOSE}")) && {
    printf '_remote -> %s\n' "${_remote}"
    printf '_host -> %s\n' "${_host}"
    printf '_repo -> %s\n' "${_repo}"
    printf '_BUILD_ARGS -> %s\n' "${_BUILD_ARGS[*]}"
}


printf >&2 '## Do stuff here...\n'
exit 1
(("${#_BUILD_ARGS}")) && {
    ssh "${_host}" script-name ${_BUILD_ARGS} "${_repo}"
} || {
    ssh "${_host}" script-name "${_repo}"
}
