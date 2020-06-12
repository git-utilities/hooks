git_remote() {
    ## Obtain first argument that is not prefixed by hyphen(s)
    for _arg in ${@}; do
        [[ "${_arg}" =~ ^-{1,2}[[:alpha:]] ]] || {
            _target_remote="${_arg}"
            break
        }
    done

    (("${#_target_remote}")) || {
        __usage__ "No target remote provided"
        return 1
    }

    ## Obtain first remote that matches target remote
    for _remote in $(git remote show); do
        [[ "${_remote}" == "${_target_remote}" ]] && {
            break
        }
    done

    (("${#_remote}")) || {
        __usage__ "No remote named ${_target_remote}"
        return 1
    }

    printf '%s\n' "${_remote}"
}
