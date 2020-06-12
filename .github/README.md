# Hooks
[heading__top]:
  #hooks
  "&#x2B06; Collection of Git hooks for automation"


Collection of Git hooks for automation


## [![Byte size of Hooks][badge__master__hooks__source_code]][hooks__master__source_code] [![Open Issues][badge__issues__hooks]][issues__hooks] [![Open Pull Requests][badge__pull_requests__hooks]][pull_requests__hooks] [![Latest commits][badge__commits__hooks__master]][commits__hooks__master]


------


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F9F0; Usage][heading__usage]

- [&#x1F5D2; Notes][heading__notes]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


------



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


- Bash version ~4 or greater

- Git version ~2 or greater

- Awk (GNU) version ~4 or greater

- For pre-push and post-push hooks the [`git-utilities/push-with-hooks`](https://github.com/git-utilities/push-with-hooks) project, or similar script, should be installed

- For post-push hooks the remote should have [`git-shell-commands`](https://github.com/git-utilities/git-shell-commands), or similar scripts installed


___


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Make a directory path for organizing repositories...


```Bash
mkdir -vp ~/git/hub/git-utilities
```


Change current working directory...


```Bash
cd ~/git/hub/git-utilities
```


Clone with Git...


```Bash
git clone --recurse-submodules git@github.com/git-utilities/hooks.git
```


Install the `git-link-hook` script by symbolically linking to a directory listed within the _`PATH`_ variable for the currently logged-in user's, eg...


```Bash
ln -s "${PWD}/git-link-hook" "${HOME}/bin/git-link-hook"
```


To update/upgrade hooks in the future utilize `git pull` `git submodule update`...


```Bash
cd ~/git/hub/git-utilities/hooks

git pull origin master

git submodule update --init --merge --recursive
```


___


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0;"


Every script within this repository is organized with the following syntax _`<hooks-target>/<command-target>`_.


For example to activate `jekyll-build` script for `post-push` target, change directories to selected repository...


```Bash
cd ~/git/hub/__org__/__repo__
```


Then run `git-link-hook` script with the hook `--name` and `--target` parameters...


```Bash
git link-hook --name jekyll-build --target post-push
```


Provided that the `git-pust-wh` script is available, the following command _should_ run the linked `post-push` script...


```Bash
git push-wh srv gh-pages
```


Note, usage tips may be output for any script by assigning _`HELP`_ as an environment variable prefix, eg...


```Bash
cd ~/git/hub/git-utilities/hooks

HELP=true ./post-push/jekyll-build
```


___


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository is not be feature complete and may not be fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


___


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)


___


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Collection of Git hooks Bash scripts for pre&#x2F;post push automation
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__hooks__master]:
  https://img.shields.io/github/last-commit/git-utilities/hooks/master.svg

[commits__hooks__master]:
  https://github.com/git-utilities/hooks/commits/master
  "&#x1F4DD; History of changes on this branch"


[hooks__community]:
  https://github.com/git-utilities/hooks/community
  "&#x1F331; Dedicated to functioning code"

[hooks__gh_pages]:
  https://github.com/git-utilities/hooks/tree/
  "Source code examples hosted thanks to GitHub Pages!"

[badge__gh_pages__hooks]:
  https://img.shields.io/website/https/git-utilities.github.io/hooks/index.html.svg?down_color=darkorange&down_message=Offline&label=Demo&logo=Demo%20Site&up_color=success&up_message=Online

[gh_pages__hooks]:
  https://git-utilities.github.io/hooks/index.html
  "&#x1F52C; Check the example collection tests"

[issues__hooks]:
  https://github.com/git-utilities/hooks/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[pull_requests__hooks]:
  https://github.com/git-utilities/hooks/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[hooks__master__source_code]:
  https://github.com/git-utilities/hooks/
  "&#x2328; Project source!"

[badge__issues__hooks]:
  https://img.shields.io/github/issues/git-utilities/hooks.svg

[badge__pull_requests__hooks]:
  https://img.shields.io/github/issues-pr/git-utilities/hooks.svg

[badge__master__hooks__source_code]:
  https://img.shields.io/github/repo-size/git-utilities/hooks
