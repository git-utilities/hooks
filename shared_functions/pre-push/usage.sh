__usage__() {
    local _message="${1}"
    cat <<EOF
## ${__DESCRIPTION__}


# ___ Setup Tips ___ #


## Symbolically link this script via link-hook command

git link-hook --name ${__NAME__} --target pre-push"

##> Or manually link to: .git/hooks/pre-push"

ln -s "${__SOURCE__}" "${PWD}/.git/hooks/pre-push""
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
