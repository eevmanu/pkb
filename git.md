# Git

- Rules for great git commit message
    - Separate **subject** from **body** with a *blank line*
    - Limit the **subject** (max 70 characters)
    - Use the imperative mood in the subject
    - Use the body to explain **what** and **why** vs. ~how~

- Settings - [git config](https://git-scm.com/docs/git-config)

    ```bash
    # list configuration options for git at "global" level
    git config --global -l
    git config --global --list
    # unset any configuration from "global" settings
    git config --global --unset {{ property key }}
    # e.g.
    git config --global --unset user.name

    # list configuration options for git at "system" level
    git config --system -l
    git config --system --list
    # unset any configuration from "system" settings
    git config --system --unset {{ property key }}

    # list configuration options for git at "local" level
    git config --local -l
    git config --local --list
    # unset any configuration from "local" settings
    git config --local --unset {{ property key }}

    # set name and email just on a specific repo
    git config --local user.name "Manuel Solorzano"
    # set this email to avoid put your real email in public commits
    # it could be find when `patch` option is clicked on your public commits
    git config --local user.email "eevmanu@users.noreply.github.com"
    ```

- Commiting - [git commit](https://git-scm.com/docs/git-commit)

    ```bash
    # in case you want to add recent changes to last commit without changing commit message
    git commit --amend --no-edit
    ```

- Branching - [git branch](https://git-scm.com/docs/git-branch) - [git checkout](https://git-scm.com/docs/git-checkout) - [git push](https://git-scm.com/docs/git-push)

    ```bash
    # show all and verbose
    # -a --all
    # -v -vv --verbose
    git branch -av

    # create and change to new branch
    # Specifying -b causes a new branch to be created
    git checkout -b {{ new branch name }}

    # create and change to new branch which will belongs to specific remote
    git checkout -b {{ new branch name }} {{ remote name }}/{{ new branch name }}

    # delete branch, locally (not on remotes)
    # -D, Shortcut for --delete --force
    git branch -D {{ branch name }}

    # delete branch on remote
    git push origin --delete {{ branch name }}

    # change branch name
    # -m --move, Move/rename a branch and the corresponding reflog.
    git branch -m {{ current branch name }} {{ new branch name }}
    ```

- Fetching - [git fetch](https://git-scm.com/docs/git-fetch)

    ```bash
    # fetch with all remotes and remove untracked branch (ones already deleted)
    git fetch --all && git fetch --prune

    # fetch with a specific remote and remove untracked branch (ones already deleted)
    git fetch {{ remote name }} --prune
    ```

- Cleaning files - [git clean](https://git-scm.com/docs/git-clean)

    ```bash
    # remove untracked files and directories
    # -d
    # Specify -d to have it recurse into such directories as well
    # all untracked files matching the specified paths will be removed
    # -f --force
    # -i --interactive
    git clean -dfi

    # not remove, just simulate
    # -n --dry-run
    git clean -dfn

    # considering files and folders on .gitignore
    # -X
    # Remove only files ignored by Git.
    # This may be useful to rebuild everything from scratch, but keep manually created files.
    git clean -dfXn
    ```

- Logs - [git log](https://git-scm.com/docs/git-log)

    ```bash
    # create "lg" alias for pretty logs
    gitlogformat="log \
        --pretty=format:'[%C(auto)%h] - %d %s %Cgreen(%cr) %C(bold blue)<%an> %Creset' \
        --graph \
        --abbrev-commit"
    git config --global alias.lg "$gitlogformat"

    # unset "lg" alias
    git config --global --unset alias.lg
    ```

- Search - [git show](https://git-scm.com/docs/git-show)

    ```bash
    # search commit by hash id
    git show {{ commit hash id }}

    # search a string on whole git database
    # https://git-scm.com/docs/git-log#Documentation/git-log.txt--Sltstringgt
    git log -S""
    ```

- Stashing - [git stash](https://git-scm.com/docs/git-stash)

    ```bash
    # create a stash from unstaged edits
    git stash

    # apply last stash
    git stash apply

    # apply specific stash, e.g. number 0
    git stash apply stash@{0}

    # delete last stash created
    git stash drop

    # delete specific stash, e.g. number 0
    git stash drop stash@{0}

    # list all available stashs
    git stash list

    # apply most recent stash and delete it
    git stash pop

    # save a git stash with a name
    git stash save "{{ stash name }}"

    # see changes inside a specific stash, e.g. number 0
    # https://git-scm.com/docs/git-stash#Documentation/git-stash.txt-showltoptionsgtltstashgt
    git stash show -p stash@{0}
    ```

- Remote (servers) - [git remote](https://git-scm.com/docs/git-remote)

    ```bash
    # list all references from a repo
    # is like doing a "ping" to the repo
    git ls-remote

    # list remotes from a repo
    # -v --verbose
    git remote -v
    ```

- Pushing - [git push](https://git-scm.com/docs/git-push)

    ```bash
    # push all branch to remote server
    # --all Push all branches
    git push {{ remote name }} --all
    ```

- HEAD

    ```
    ~<n> refers to the <n>th grandparent.
    HEAD~1 refers to the commit's first parent.
    HEAD~2 refers to the first parent of the commit's first parent.

    ^<n> refers to the the <n>th parent.
    HEAD^1 refers to the commit's first parent.
    HEAD^2 refers to the commit's second parent.
    A commit can have two parents in a merge commit.

    https://backlog.com/git-tutorial/using-branches/git-switch-branches/
    ```

![explain HEAD](https://i.imgur.com/mSD77uh.png "explain HEAD")

- Diff - [git diff](https://git-scm.com/docs/git-diff)

    ```bash
    # see change between commits
    git diff HEAD HEAD^1
    ```

- Reset - [git reset](https://git-scm.com/docs/git-reset)

    ```bash
    # The last three commits (HEAD, HEAD^, and HEAD~2)

    # --hard Resets the index and working tree.
    git reset --hard {{ commit id }}
    git reset --hard {{ remote name }}/{{ branch name }}

    # un-commit last un-pushed git commit without losing the changes
    git reset --soft HEAD~1
    ```

- Extras

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
    ```

- Download repo's branch as tar file

    ```bash
    $ wget https://github.com/{{ user }}/{{ repo }}/archive/{{ branch }}.tar.gz
    # e.g.
    $ wget https://github.com/jakubroztocil/httpie/archive/master.tar.gz
    ```

- Miswrite `git`

    ```bash
    alias gti="git"
    ```

### Resources

- [git-extras](https://github.com/tj/git-extras) - GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
- [git-secrets](https://github.com/awslabs/git-secrets) - Prevents you from committing secrets and credentials into git repositories
- [git-standup](https://github.com/kamranahmedse/git-standup) - Recall what you did on the last working day.
- [github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet) - A list of cool features of Git and GitHub. http://git.io/sheet
- [tips](https://github.com/git-tips/tips) - Most commonly used git tips and tricks. http://git.io/git-tips
- [Git Command Explorer](https://gitexplorer.com/) - Find the right commands you need without digging through the web.
- [Operaciones Git - Git Tips](https://gist.github.com/jelcaf/1404619) - Mini-trucos de Git para facilitarme la tarea
- [git cheat sheet](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
- [Easily rename your Git default branch from 'master' to 'main' ](https://twitter.com/shanselman/status/1269838158650195968)
    - [Easily rename your Git default branch from master to main](https://www.hanselman.com/blog/EasilyRenameYourGitDefaultBranchFromMasterToMain.aspx)
