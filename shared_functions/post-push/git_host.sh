git_host() {
    local _remote="${1:-No remote name provided}"

    ## Parse for SSH host of Git remote
    local _host="$(git remote show "${_remote}" | awk '{
      if ($0 ~ "Push") {
        gsub(":", " ", $0)
        print $3
        nextfile
      }
    }')"

    (("${#_host}")) || {
        __usage__ "Host could not be parsed for remote ${_remote}"
        return 1
    }

    printf '%s\n' "${_host}"
}
