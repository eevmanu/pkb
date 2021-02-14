# Git

## Rules for commit message

- Separate **subject** from **body** with a *blank line*
- Limit the **subject** (max 70 characters)
- Use the [imperative mood](https://github.com/RomuloOliveira/commit-messages-guide/tree/6d40329fc99df60b700d4ab500881877a76e6886#use-imperative-form) in the subject
- Use the body to explain **why**, **for what**  and **how**
- [Writing system software: code comments.](http://antirez.com/news/124) - [backup](https://web.archive.org/web/20200910150753/http://antirez.com/news/124)

Related links
- [RomuloOliveira/commit-messages-guide](https://github.com/RomuloOliveira/commit-messages-guide)

## Config

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

Specify **merge** strategy by default when `git pull`

```bash
# Pulling without specifying how to reconcile divergent branches is discouraged.
$ git config --local pull.rebase false

# TODO try it
# git config --local pull.ff false
```

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

- Related links:
    - [How to set up a flatpak version of Meld as git mergetool?](https://stackoverflow.com/questions/55881383/how-to-set-up-a-flatpak-version-of-meld-as-git-mergetool)
    - [How to configure “flatpak run org.gnome.meld” as git diff.tool and merge.tool](https://askubuntu.com/questions/1140455/how-to-configure-flatpak-run-org-gnome-meld-as-git-diff-tool-and-merge-tool)
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
    git commit --amend --no-edit
    ```

[git checkout](https://git-scm.com/docs/git-checkout)

- go to any commit in the history as `detached HEAD`

    ```bash
    $ git checkout {{ commit id }}
    ```

- move back from any `detached HEAD` to latest commit

    ```bash
    $ git checkout master
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

- delete branch, locally (not on remotes)

    ```bash
    # -D, Shortcut for --delete --force
    $ git branch -D {{ branch name }}
    ```

[git fetch](https://git-scm.com/docs/git-fetch)

- fetch with all remotes and remove untracked branch (ones already deleted)

    ```bash
    $ git fetch --all && git fetch --prune
    ```

- fetch with a specific remote and remove untracked branch (ones already deleted)

    ```bash
    $ git fetch {{ remote name }} --prune
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

- remove only files ignored by Git, considering files and folders on `.gitignore`

    ```bash
    # -X
    # This may be useful to rebuild everything from scratch, but keep manually created files.
    $ git clean -dfXn
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
    $ git log -S""
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

[git reset](https://git-scm.com/docs/git-reset)

- **hard** reset

    ```bash
    # --hard Resets the index and working tree.
    git reset --hard {{ commit id }}
    git reset --hard {{ remote name }}/{{ branch name }}
    ```

- **soft** reset

    ```bash
    # un-commit last un-pushed git commit without losing the changes
    git reset --soft HEAD~1
    ```

Extras

```bash
# set VS Code for git
git config --local core.editor vim

# set VS Code as editor when using git cola (https://git-cola.github.io/)
git config --global gui.editor code
# and to unset it
git config --global --unset gui.editor

# set short command for "git status"
git config --global alias.st status
# and to unset it
git config --global --unset alias.st

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

## Github

### Setup

#### SSH Key

- Check in your github account any [SSH keys](https://github.com/settings/keys), more info [here](https://docs.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys)

    ```bash
    $ ls -la $HOME/.ssh
    ```

- If don't have anyone, [generate one](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

    ```bash
    $ ssh-keygen \
        -t rsa \
        -b 4096 \
        -C "{{ your github username }}@users.noreply.github.com" \
        -f $HOME/.ssh/{{ name you want }}

    # e.g.:
    $ ssh-keygen \
        -t rsa \
        -b 4096 \
        -C "eevmanu@users.noreply.github.com" \
        -f $HOME/.ssh/github

    # after that, create a good passphrase
    ```

    - [ssh-keygen(1) - Linux man page](https://linux.die.net/man/1/ssh-keygen)

- If key was added in `$HOME/.ssh`, don't need to add that identity, otherwise, add it:

    ```bash
    $ ssh-add $HOME/.ssh/{{ name you want }}

    # e.g.:
    $ ssh-add $HOME/.ssh/id_rsa
    ```

- Verify which identities are attached to you ssh-agent

    ```bash
    $ ssh-add -l
    $ ssh-add -L
    ```

    - [How to list keys added to ssh-agent with ssh-add?](https://unix.stackexchange.com/questions/58969/how-to-list-keys-added-to-ssh-agent-with-ssh-add)
    - [ssh-add(1) - Linux man page](https://linux.die.net/man/1/ssh-add)

- If needed, to remove an identity from ssh agent

    ```bash
    $ ssh-add -d
    $ ssh-add -D
    ```

- Add previous generated SSH key to GitHub, steps [here](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

- [Test connection](https://docs.github.com/en/github/authenticating-to-github/testing-your-ssh-connection)

    ```bash
    $ ssh -T git@github.com
    # enter your passphrase
    ```

- If you want to change passphrase, check [here](https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases)

#### GPG Key

<!-- TODO -->

- [Managing commit signature verification](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

### Resources

- [2.4 Git Basics - Undoing Things](https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things)
- [3.1 Git Branching - Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
- [7.7 Git Tools - Reset Demystified](https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified)
- [tj/git-extras](https://github.com/tj/git-extras) - GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
- [awslabs/git-secrets](https://github.com/awslabs/git-secrets) - Prevents you from committing secrets and credentials into git repositories
- [kamranahmedse/git-standup](https://github.com/kamranahmedse/git-standup) - Recall what you did on the last working day.
- [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet) - A list of cool features of Git and GitHub. http://git.io/sheet
- [git-tips/tips](https://github.com/git-tips/tips) - Most commonly used git tips and tricks. http://git.io/git-tips
- [agis/git-style-guide](https://github.com/agis/git-style-guide)
- [Operaciones Git - Git Tips](https://gist.github.com/jelcaf/1404619) - Mini-trucos de Git para facilitarme la tarea
- [Git Command Explorer](https://gitexplorer.com/) - Find the right commands you need without digging through the web.
- [git cheat sheet](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
- [Easily rename your Git default branch from 'master' to 'main' ](https://twitter.com/shanselman/status/1269838158650195968)
    - [Easily rename your Git default branch from master to main](https://www.hanselman.com/blog/EasilyRenameYourGitDefaultBranchFromMasterToMain.aspx)
- [A survey of git best practices](https://xdg.me/blog/a-survey-of-git-best-practices/)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
- 2020-04-19 - [Git branch naming conventions](https://deepsource.io/blog/git-branch-naming-conventions/)
- 2019-02-08 - [Best practices for using Git](https://deepsource.io/blog/git-best-practices/)
- [Git merge master into feature branch](https://stackoverflow.com/questions/16955980/git-merge-master-into-feature-branch)
