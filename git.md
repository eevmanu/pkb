<!-- omit in toc -->
# Git

<!-- omit in toc -->
## Table of contents

- [Commit message: best practices](#commit-message-best-practices)
- [Manage configs](#manage-configs)
- [My configs](#my-configs)
- [Merge strategy](#merge-strategy)
- [Merge tool](#merge-tool)
- [Commands](#commands)
  - [Extras](#extras)
- [Branch-based workflow / strategy](#branch-based-workflow--strategy)
- [How to contribute](#how-to-contribute)
- [Github](#github)
  - [Setup SSH Key](#setup-ssh-key)
  - [Setup GPG Key](#setup-gpg-key)
  - [Project management features](#project-management-features)
- [References](#references)
  - [Git official docs - important concepts](#git-official-docs---important-concepts)
  - [Github repos & gists](#github-repos--gists)
  - [Stack Overflow Q&A](#stack-overflow-qa)
  - [Pending](#pending)

## Commit message: best practices

- Separate **subject** from **body** with a *blank line*
- Limit the **subject** (max 70 characters)
- Use the [imperative mood](https://github.com/RomuloOliveira/commit-messages-guide/tree/6d40329fc99df60b700d4ab500881877a76e6886#use-imperative-form) in the subject
- Use the body to explain **why**, **for what**  and **how**
- [Writing system software: code comments.](http://antirez.com/news/124) - [backup](https://web.archive.org/web/20200910150753/http://antirez.com/news/124)

References:

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
- [RomuloOliveira/commit-messages-guide](https://github.com/RomuloOliveira/commit-messages-guide)
- [conventional-commits/conventionalcommits.org](https://github.com/conventional-commits/conventionalcommits.org) - The conventional commits specification
- [erlang/otp/wiki/writing-good-commit-messages](https://github.com/erlang/otp/wiki/writing-good-commit-messages) - Writing good commit messages
- [joelparkerhenderson/git-commit-message](https://github.com/joelparkerhenderson/git-commit-message) - Git commit message: how to write a great git commit message and commit template for version control
- [robertpainsi/b632364184e70900af4ab688decf6f53](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53) - Commit message guidelines
- [stephenparish/9941e89d80e2bc58a153](https://gist.github.com/stephenparish/9941e89d80e2bc58a153) - AngularJS Git Commit Message Conventions
- [lisawolderiksen/a7b99d94c92c6671181611be1641c733](https://gist.github.com/lisawolderiksen/a7b99d94c92c6671181611be1641c733) - Use a Git commit message template to write better commit messages
- [commitizen-tools/commitizen](https://github.com/commitizen-tools/commitizen) - Create committing rules for projects 🚀 auto bump versions ⬆️ and auto changelog generation 📂
- [Can you recommend a good commit message template / guidelines to enforce in the company? [closed]](https://softwareengineering.stackexchange.com/q/42110)

## Manage configs

[Docs: git config](https://git-scm.com/docs/git-config)

Local configuration on `.git/config`

```bash
# list configuration
$ git config --local --list
$ git config --local -l

# unset properties
git config --local --unset {{ property key }}
```

Global configuration on `$HOME/.gitconfig`

```bash
$ git config --global --list
$ git config --global -l

$ git config --global --unset {{ property key }}
# e.g.
$ git config --global --unset user.name
```

System configuration on `/etc/gitconfig`

```bash
$ git config --system -l
$ git config --system --list

$ git config --system --unset {{ property key }}
# e.g.
$ git config --system --unset user.name
```

## My configs

Generic local config for any github repo (not work related)

```bash
# set name and email just on a specific repo
$ git config --local user.name "Manuel Solorzano"

# set this email to avoid put your real email in public commits
# it could be find when `patch` option is clicked on your public commits
$ git config --local user.email "eevmanu@users.noreply.github.com"
```

Local config for github repo related to work

```bash
$ git config --local user.name "Manuel Solorzano"

$ git config --local user.email {{ work email }}
# e.g.:
```

## Merge strategy

Specify **merge** strategy by default when `git pull`, avoid a warning on every `git pull` since version `2.27`

```bash
# Pulling without specifying how to reconcile divergent branches is discouraged.
$ git config --local pull.rebase false

# if `main` branch is not being altered locally, is safe to choose this option
$ git config --local pull.ff only
```

References:

- [How to deal with this git warning? “Pulling without specifying how to reconcile divergent branches is discouraged”](https://stackoverflow.com/q/62653114/)
- [Pull request merge strategies](https://confluence.atlassian.com/bitbucketserver/pull-request-merge-strategies-844499235.html)
    - from `main` to `featureX`: Rebase, fast-forward / Rebase, merge
    - from `featureX` to `main`: Squash
- [Git tips: Use only fast-forward merges (with rebase)](https://medium.com/@mvuksano/git-tips-use-only-fast-forward-merges-with-rebase-c80c9d260a83)
- [git fast-forward merge vs git rebase, same thing?](https://www.reddit.com/r/git/comments/56ie0x/git_fastforward_merge_vs_git_rebase_same_thing/)

## Merge tool

Instructions related to use `merge` as diff tool

```bash
$ git config --local diff.tool {{ }}
$ git config --local diff.guitool {{ }}
$ git config --local merge.tool {{ }}
$ git config --local merge.guitool {{ }}
```

- To set

    - Opt1: directly into local settings config `.git/config`

        ```ini
        [difftool]
            prompt = false

        [diff]
            tool = meld_flatpak

        # unable to open temporary files created by git
        # [difftool "meld_flatpak"]
        # 	cmd = flatpak run org.gnome.meld "$LOCAL" "$REMOTE"

        # workaround to allow access to temporary files git create
        # issue is allow access to whole /tmp directory
        # [difftool "meld_flatpak"]
        # 	cmd = flatpak run \"--filesystem=/tmp\" org.gnome.meld "$LOCAL" "$REMOTE"

        # workaround without allowing full access to /tmp
        # issue is doesn't work with diff between folders
        # [difftool "meld_flatpak"]
        # 	cmd = flatpak run --file-forwarding org.gnome.meld \"@@\" $LOCAL \"@@\" \"@@\" $REMOTE \"@@\"

        # workaround to allow meld work with diff between folders
        [difftool "meld_flatpak"]
            cmd = flatpak run \"--filesystem=$(realpath \"$LOCAL\")\" \"--filesystem=$(realpath \"$REMOTE\")\" org.gnome.meld \"$LOCAL\" \"$REMOTE\"
        ```

    - Opt2: with git commands

        In `local` config file

        ```bash
        $ git config --local difftool.prompt false
        $ git config --local diff.tool meld_flatpak
        $ git config --local difftool.meld_flatpak.cmd 'flatpak run "--filesystem=$(realpath "$LOCAL")" "--filesystem=$(realpath "$REMOTE")" org.gnome.meld "$LOCAL" "$REMOTE"'
        ```

        In `global` config file

        ```bash
        $ git config --global difftool.prompt false
        $ git config --global diff.tool meld_flatpak
        $ git config --global difftool.meld_flatpak.cmd 'flatpak run "--filesystem=$(realpath "$LOCAL")" "--filesystem=$(realpath "$REMOTE")" org.gnome.meld "$LOCAL" "$REMOTE"'
        ```

- To unset

    - In `local` config

        ```bash
        $ git config --local --unset diff.tool
        $ git config --local --unset difftool.prompt
        $ git config --local --unset difftool.meld_flatpak.cmd
        ```

    - In `global` config

        ```bash
        $ git config --global --unset diff.tool
        $ git config --global --unset difftool.prompt
        $ git config --global --unset difftool.meld_flatpak.cmd
        ```

References:

- [Setting up and using Meld as your git difftool and mergetool](https://stackoverflow.com/q/34119866)
- [How to set up a flatpak version of Meld as git mergetool?](https://stackoverflow.com/q/55881383)
- [How to configure “flatpak run org.gnome.meld” as git diff.tool and merge.tool](https://askubuntu.com/q/1140455)
- [Using flatpak version of Meld as an external git diff tool fails #1423](https://github.com/flatpak/flatpak/issues/1423)
- [Allowing /tmp for git difftool #11](https://github.com/flathub/org.gnome.meld/issues/11)

## Commands

[The HEAD](https://git-scm.com/book/en/v2/Git-Internals-Git-References#ref_the_ref:~:text=The%20HEAD,-The)

![explain HEAD](https://i.imgur.com/mSD77uh.png "explain HEAD")

```
# The last three commits (HEAD, HEAD^, and HEAD~2)

~<n> refers to the <n>th grandparent.
HEAD~1 refers to the commit's first parent.
HEAD~2 refers to the first parent of the commit's first parent.

^<n> refers to the the <n>th parent.
HEAD^1 refers to the commit's first parent.
HEAD^2 refers to the commit's second parent.
A commit can have two parents in a merge commit.

https://backlog.com/git-tutorial/using-branches/git-switch-branches/
```

[git commit](https://git-scm.com/docs/git-commit)

- Add recent changes without adding another commit, just overwrite last commit

    ```bash
    # in case you want to add recent changes to last commit without changing commit message
    $ git commit --amend --no-edit
    ```

[git checkout](https://git-scm.com/docs/git-checkout)

- go to any commit in the history as `detached HEAD`

    ```bash
    $ git checkout {{ commit id }}
    ```

- move back from any `detached HEAD` to latest commit

    ```bash
    $ git checkout master

    # or new name of master: main
    $ git checkout main
    ```

- create a new branch and change to it

    ```bash
    $ git checkout -b {{ new branch name }}
    ```

- create a new branch, map it with a specific branch name on a specific remote and change to it

    ```bash
    $ git checkout -b {{ new branch name }} {{ remote name }}/{{ new branch name }}
    ```

[git branch](https://git-scm.com/docs/git-branch)

- show branches

    ```bash
    # -a --all
    # -v -vv --verbose
    $ git branch -av
    ```
- change branch name

    ```bash
    # -m --move, Move/rename a branch and the corresponding reflog.
    $ git branch -m {{ current branch name }} {{ new branch name }}
    ```

- delete branch on local (not on remotes)

    ```bash
    # -D, Shortcut for --delete --force
    $ git branch -D {{ branch name }}
    ```

[git fetch](https://git-scm.com/docs/git-fetch)

- Before fetching, remove any remote-tracking references that no longer exist on the remote "origin"

    ```bash
    $ git fetch --dry-run --prune origin
    $ git fetch --prune --progress origin
    ```

- Fetch all remotes

    ```bash
    $ git fetch --all --tags --dry-run
    $ git fetch --all --tags --progress
    ```

- fetch with a specific remote and remove untracked branch (ones already deleted)

    ```bash
    $ git fetch --prune {{ remote name }}
    ```

[git clean](https://git-scm.com/docs/git-clean)

- remove untracked files and directories

    ```bash
    # -d                recurse through directories
    # -f --force
    # -i --interactive
    $ git clean -dfi
    ```

- not remove, just **simulate**

    ```bash
    # -n --dry-run
    $ git clean -dfn
    ```

- remove files without taking into consideration `.gitignore`

    ```bash
    # This allows removing all untracked files, including build products
    # This can be used to create a pristine working directory to test a clean build.
    $ git clean -dfxn

    # without dry run
    $ git clean -dfx
    ```

- remove only files ignored by Git, considering files and folders on `.gitignore`

    ```bash
    # -X
    # This may be useful to rebuild everything from scratch, but keep manually created files.
    $ git clean -dfXn

    # without dry run
    $ git clean -dfX
    ```

[git log](https://git-scm.com/docs/git-log)

- create git `lg` alias for pretty logs

    ```bash
    $ gitlogformat="log \
        --pretty=format:'[%C(auto)%h] - %d %s %Cgreen(%cr) %C(bold blue)<%an> %Creset' \
        --graph \
        --abbrev-commit"
    $ git config --global alias.lg "$gitlogformat"
    ```

- unset `lg` alias

    ```bash
    $ git config --global --unset alias.lg
    ```

-  search a string on whole git database, [git log -S{search term}](https://git-scm.com/docs/git-log#Documentation/git-log.txt--Sltstringgt)

    ```bash
    $ git log -S"{{ search term }}"
    ```

[git show](https://git-scm.com/docs/git-show)

- search commit by hash id

    ```bash
    $ git show {{ commit hash id }}
    ```

[git stash](https://git-scm.com/docs/git-stash)

- create stash from specific files

    ```bash
    $ git stash push -m {{ stash name }} /path/to/file
    ```

- create a stash from unstaged edits

    ```bash
    $ git stash
    ```

- apply last stash

    ```bash
    $ git stash apply
    ```

- apply specific stash, e.g. number 0

    ```bash
    $ git stash apply stash@{0}
    ```

- delete last stash created

    ```bash
    $ git stash drop
    ```

- delete specific stash, e.g. number 0

    ```bash
    $ git stash drop stash@{0}
    ```

- list all available stashs

    ```bash
    $ git stash list
    ```
- apply most recent stash and delete it

    ```bash
    $ git stash pop
    ```

- save a git stash with a name

    ```bash
    $ git stash save "{{ stash name }}"
    ```

- see changes inside a specific stash, e.g. number 0 [git stash show {options} {stash}](https://git-scm.com/docs/git-stash#Documentation/git-stash.txt-showltoptionsgtltstashgt)

    ```bash
    $ git stash show -p stash@{0}
    ```

[git remote](https://git-scm.com/docs/git-remote)

- list all references from a repo

    ```bash
    # is like doing a "ping" to the repo
    $ git ls-remote
    ```

- list remotes from a repo

    ```bash
    # -v --verbose
    $ git remote -v
    ```

- change remote - [How to change the URI (URL) for a remote Git repository?](https://stackoverflow.com/q/2432764/)

    ```bash
    $ git remote set-url origin {{ url }}
    ```

[git push](https://git-scm.com/docs/git-push)

- push all branch to remote server

    ```bash
    # --all Push all branches
    $ git push {{ remote name }} --all
    ```

- delete branch on remote server

    ```bash
    $ git push origin --delete {{ branch name }}
    ```

[git pull](https://git-scm.com/docs/git-pull)

- runs `git fetch` with the given parameters and calls `git merge` to merge the retrieved branch heads into the current branch
- With `--rebase`, it runs `git rebase` instead of git merge

- default version

    ```bash
    $ git pull origin <src (in origin remote)>:<dest (in my local machine)>
    $ git pull origin master:master
    $ git pull origin main:main
    ```

- Merge remote branch `next` into current branch:

    ```bash
    $ git pull origin next

    $ git fetch origin
    $ git merge origin/next
    ```

[git merge](https://git-scm.com/docs/git-merge)

- Merging local `master` branch into current branch

    ```bash
    $ git merge master
    ```

[git diff](https://git-scm.com/docs/git-diff)

- Differences between content of file from last commit and unstashed changes

    ```bash
    $ git diff /path/to/file
    ```

- Between last 2 commits

    ```bash
    # see change between commits
    $ git diff HEAD HEAD^1
    ```

- Git diff at word or char level - [reference](https://makandracards.com/makandra/28067-git-diff-per-word-or-character)

    ```bash
    # word by word
    $ git diff --color-words /path/to/file1 /path/to/file2
    # char by char
    $ git diff --color-words=. /path/to/file1 /path/to/file2
    ```

[git restore](https://git-scm.com/docs/git-restore)

- remove unstashed changes to get file version from latest commit

    ```bash
    $ git restore path/to/file
    ```

[git reset](https://git-scm.com/docs/git-reset)

- **mixed** mode

    ```bash
    # implicit
    $ git reset HEAD~

    # explicit
    $ git reset HEAD~
    ```

- **soft** mode

    ```bash
    # un-commit last un-pushed git commit without losing the changes
    $ git reset --soft HEAD~1
    ```

- **hard** mode

    ```bash
    # --hard Resets the index and working tree.
    $ git reset --hard {{ commit id }}
    $ git reset --hard {{ remote name }}/{{ branch name }}

    $ git reset --hard HEAD~1
    ```

References:

- [How do I undo the most recent local commits in Git?](https://stackoverflow.com/q/927358/)
- [What's the difference between HEAD^ and HEAD~ in Git?](https://stackoverflow.com/q/2221658/)

[git rev-parse](https://git-scm.com/docs/git-rev-parse)

- get latest commit from actual branch

    ```bash
    $ git rev-parse --short HEAD
    iao90oi
    ```

[git rebase](https://git-scm.com/docs/git-rebase)

- [When do you use Git rebase instead of Git merge? [closed]](https://stackoverflow.com/q/804115/)

```bash
$ git branch --show-current
main

$ git checkout cool-feature
$ git rebase main

$ git branch --show-current
cool-feature

$ git checkout main
$ git merge cool-feature
```

[git rm](https://git-scm.com/docs/git-rm)

```bash
$ git rm -r --cached ..
```

[gitignore](https://git-scm.com/docs/gitignore)

- An asterisk "`*`" matches anything except a slash.
- A leading "`**`" followed by a slash "`/`" means match in all directories.
- A trailing "`/**`" matches everything inside.
- A slash followed by two consecutive asterisks then ("`a/**/b`") a slash matches zero or more directories.

### Extras

```bash
# set VS Code for git
git config --local core.editor vim

# set VS Code as editor when using git cola (https://git-cola.github.io/)
git config --global gui.editor code
# and to unset it
git config --global --unset gui.editor

# set short command for "git status"
git config --global alias.st status
git config --local alias.st status
# and to unset it
git config --global --unset alias.st
git config --local --unset alias.st

# avoid asking to reenter password for 1 hour = 3600 sec, local setting
git config --local credential.helper "cache --timeout=3600"

# https://git-scm.com/docs/git-config#Documentation/git-config.txt-helpautoCorrect
git config --global help.autocorrect 1
```

Download repo's branch as `tar` file

```bash
$ wget https://github.com/{{ user }}/{{ repo }}/archive/{{ branch }}.tar.gz

# e.g.
$ wget https://github.com/jakubroztocil/httpie/archive/master.tar.gz
```

Replace `gti` to `git` when miswrite, add to your `$HOME/.bashrc` or `$HOME/.profile`

```bash
alias gti="git"
```

## Branch-based workflow / strategy

- [GitHub flow](https://guides.github.com/introduction/flow/)
- [Three flow](https://www.nomachetejuggling.com/2017/04/09/a-different-branching-strategy/)
- [Simplified Git flow](https://medium.com/goodtogoat/simplified-git-flow-5dc37ba76ea8)
- [Release flow](https://docs.microsoft.com/en-us/azure/devops/learn/devops-at-microsoft/release-flow)
- [Gitlab flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)
- [Git DMZ flow](https://gist.github.com/djspiewak/9f2f91085607a4859a66)
- [Trunk based development](https://trunkbaseddevelopment.com/)
- [Git flow](https://nvie.com/posts/a-successful-git-branching-model/)
- [Git(flow) workflow for web development](https://softwareengineering.stackexchange.com/q/285908/)
- [What are the pros and cons of git-flow vs github-flow? [closed]](https://stackoverflow.com/q/18188492/)

## How to contribute

- [Gist: Keeping a fork up to date](https://gist.github.com/CristinaSolana/1885435)
- [How to keep your Git-Fork up to date](https://stefanbauer.me/articles/how-to-keep-your-git-fork-up-to-date)
- [Syncing a fork](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork)

## Github

### Setup SSH Key

Check in your github account any [SSH keys](https://github.com/settings/keys), more info [here](https://docs.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys)

  ```bash
  $ ls -la $HOME/.ssh
  ```

If don't have anyone, [generate one](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

  ```bash
  $ ssh-keygen \
      -t ed25519 \
      -C "{{ your github username }}@users.noreply.github.com" \
      -f $HOME/.ssh/{{ name you want }}

  # e.g.:
  $ ssh-keygen \
      -t rsa \
      -b 4096 \
      -C "eevmanu@users.noreply.github.com" \
      -f $HOME/.ssh/github

  $ ssh-keygen \
      -t rsa \
      -b 4096 \
      -C "manu->digitalocean.com" \
      -f $HOME/.ssh/digitalocean

  # after that, create a good passphrase
  ```

  - [ssh-keygen(1) - Linux man page](https://linux.die.net/man/1/ssh-keygen)

Verify ssh agent is up

  ```bash
  $ eval "$(ssh-agent -s)"
  ```

If key was added in `$HOME/.ssh`, don't need to add that identity, otherwise, add it:

  ```bash
  $ ssh-add $HOME/.ssh/{{ name you want }}

  # e.g.:
  $ ssh-add $HOME/.ssh/id_rsa
  ```

Verify which identities are attached to you ssh-agent

  ```bash
  $ ssh-add -l
  $ ssh-add -L
  ```

  - [How to list keys added to ssh-agent with ssh-add?](https://unix.stackexchange.com/q/58969/)
  - [ssh-add(1) - Linux man page](https://linux.die.net/man/1/ssh-add)

If needed, to remove an identity from ssh agent

  ```bash
  $ ssh-add -d
  $ ssh-add -D
  ```

Add previous generated SSH key to GitHub, steps [here](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

[Test connection](https://docs.github.com/en/github/authenticating-to-github/testing-your-ssh-connection)

  ```bash
  $ ssh -vT git@github.com
  # if you have passphrase, enter it
  # check in output which keys is trying to use
  ```

If you want to change passphrase, check [here](https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases)

Copy public portion of your SSH key secure

  ```bash
  $ xclip -sel clip < /.../{{ name of your key }}.pub

  # e.g.:
  $ xclip -sel clip < ~/.ssh/id_rsa.pub
  ```

References:

- [Upgrade Your SSH Key to Ed25519](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54)
- [ECDSA vs ECDH vs Ed25519 vs Curve25519](https://security.stackexchange.com/q/50878/)
- [RSA vs. DSA for SSH authentication keys](https://security.stackexchange.com/q/5096/)
- [Serious Applied Cryptography in 280 characters or less](https://twitter.com/spazef0rze/status/1329511286191820800)
- [SafeCurves: choosing safe curves for elliptic-curve cryptography](https://safecurves.cr.yp.to/)

### Setup GPG Key

<!-- TODO -->

- [Managing commit signature verification](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

### Project management features

- [Github - Project Management](https://github.com/features/project-management/)
- [Managing project boards](https://docs.github.com/en/github/managing-your-work-on-github/managing-project-boards)
- [About project boards](https://docs.github.com/en/github/managing-your-work-on-github/about-project-boards)
- [GitHub Project Management Tutorial - Setup GitHub Projects & Automations](https://www.youtube.com/watch?v=ff5cBkPg-bQ)

## References

### Git official docs - important concepts

- [2.2 Git Basics - Recording Changes to the Repository](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)
- [2.4 Git Basics - Undoing Things](https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things)
- [3.1 Git Branching - Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
- [7.7 Git Tools - Reset Demystified](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified)

### Github repos & gists

- [tj/git-extras](https://github.com/tj/git-extras) - GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
- [awslabs/git-secrets](https://github.com/awslabs/git-secrets) - Prevents you from committing secrets and credentials into git repositories
- [kamranahmedse/git-standup](https://github.com/kamranahmedse/git-standup) - Recall what you did on the last working day.
- [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet) - A list of cool features of Git and GitHub. http://git.io/sheet
- [git-tips/tips](https://github.com/git-tips/tips) - Most commonly used git tips and tricks. http://git.io/git-tips
- [agis/git-style-guide](https://github.com/agis/git-style-guide) - A Git Style Guide
- [jelcaf/1404619](https://gist.github.com/jelcaf/1404619) - Git Tips - Mini-trucos de Git para facilitarme la tarea
- [lisawolderiksen/f9747a3ae1e58e9daa7d176ab98f1bad](https://gist.github.com/lisawolderiksen/f9747a3ae1e58e9daa7d176ab98f1bad) - Add co-authors to Git commits

### Stack Overflow Q&A

- [Git merge master into feature branch](https://stackoverflow.com/q/16955980/)
- [Git/GitHub branching standards & conventions](https://gist.github.com/digitaljhelms/4287848)
- [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
- [Git pull/fetch with refspec differences](https://stackoverflow.com/q/7169103/)
- [How do I delete a Git branch locally and remotely?](https://stackoverflow.com/q/2003505/)
- [How do I force “git pull” to overwrite local files?](https://stackoverflow.com/q/1125968/)
- [How do I revert a Git repository to a previous commit?](https://stackoverflow.com/q/4114095/)
- [How do I check out a remote Git branch?](https://stackoverflow.com/q/1783405/)
- [How do I undo 'git add' before commit?](https://stackoverflow.com/q/348170/)
- [How to recover a dropped stash in Git?](https://stackoverflow.com/q/89332/)
- [Visualize branches on GitHub](https://stackoverflow.com/q/27469952)

### Pending

- [Git Command Explorer](https://gitexplorer.com/) - Find the right commands you need without digging through the web.
- [git cheat sheet](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
- [Easily rename your Git default branch from 'master' to 'main' ](https://twitter.com/shanselman/status/1269838158650195968)
    - [Easily rename your Git default branch from master to main](https://www.hanselman.com/blog/EasilyRenameYourGitDefaultBranchFromMasterToMain.aspx)
- [A survey of git best practices](https://xdg.me/blog/a-survey-of-git-best-practices/)
- 2020-04-19 - [Git branch naming conventions](https://deepsource.io/blog/git-branch-naming-conventions/)
- 2019-02-08 - [Best practices for using Git](https://deepsource.io/blog/git-best-practices/)
- [Duplicating a repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/duplicating-a-repository)
- [! [remote rejected] errors after mirroring a git repository](https://stackoverflow.com/q/34265266/)
- [Learn Git Branching](https://learngitbranching.js.org/)
- [sdras/awesome-actions](https://github.com/sdras/awesome-actions)
- [Working tree vs working directory](https://stackoverflow.com/q/39128500)
