git_repo() {
    local _remote="${1:-No remote name provided}"
    local _repo="$(git remote show "${_remote}" | awk '{
      if ($0 ~ "Push") {
        gsub("/", " ", $0)
        print $NF
        nextfile
      }
    }')"

    (("${#_repo}")) || {
        __usage__ "Repository could not be parsed for remote ${_remote}"
        return 1
    }

    printf '%s\n' "${_repo}"
}
