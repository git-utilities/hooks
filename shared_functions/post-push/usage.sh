__usage__() {
    local _message="${1}"
    cat <<EOF
## ${__DESCRIPTION__}


# ___ Setup Tips ___ #


## Example SSH configuraiton: ~/.ssh/config

Host ${_host:-HOST}
    IdentitiesOnly yes
    IdentityFile ~/.ssh/private_key
    HostName 192.168.0.5
    User _user_name_

## Example Git config: .git/config

[remote "${_remote:-REMOTE}"]
    url = ${_host:-HOST}:git/${_repo:-REPO}
    fetch = +refs/heads*:refs/remotes/dev/*

##> Note above should be added via

git remote add ${_remote:-REMOTE} ${_host:-HOST}:git/${_repo:-REPO}

## Symbolically link this script via link-hook command

git link-hook --name ${__NAME__} --target post-push

##> Or manually link to: .git/hooks/post-push

ln -s "${__SOURCE__}" "${PWD}/.git/hooks/post-push"
EOF

    (("${#__USAGE_TIPS__[@]}")) && {
        for _tip in ${__USAGE_TIPS__[@]}; do
            printf '\n%s\n' "${_tip}"
        done
    }

    (("${#_message}")) && {
        printf >&2 '\n\n## Error: %s\n' "${_message}"
    }
}
