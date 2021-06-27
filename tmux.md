# Tmux

Useful to keep sessions or pair programming in a ssh

Basics commands

Action                                       | Shortcut
---------------------------------------------|-------------
means this is for tmux not for shell         | `ctrl+b`
new window                                   | `ctrl+b` + `c`
change name on current window                | `ctrl+b` + `,`
change to previous window - circle behaviour | `ctrl+b` + `p`
change to next window - circle behaviour     | `ctrl+b` + `n`
list windows and can select                  | `ctrl+b` + `w`
split horizontal current pane                | `ctrl+b` + `"`
split vertical current pane                  | `ctrl+b` + `%`
split horizontal current pane                | `ctrl+b` + `:`
n is a number - go to window "n"             | `ctrl+b` + `{`
dettach session                              | `ctrl+b` + `d`
activate scroll in tmux session              | `ctrl+b` + `[`
deactivate scroll in tmux session            | `ctrl+c`
Detached session                             | `ctrl+b + d`

Create a new session

```bash
$ tmux new -s { name }
```

List sessions

```bash
$ tmux ls
$ tmux list-s
$ tmux list-sessions
```

Attach to a session

```bash
$ tmux a -t { name }
$ tmux attach -t { name }
```

## References

Github

- [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058)
- [tmux cheat sheet](https://gist.github.com/andreyvit/2921703)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Persists tmux environment across system restarts.
- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [.tmux](https://github.com/gpakosz/.tmux) - Oh My Tmux! Pretty & versatile tmux configuration

Stack Overflow Q&A

- [How to enable scrolling in tmux panels with mouse wheel? [closed]](https://stackoverflow.com/q/7798103)
- [How to increase scrollback buffer size in tmux?](https://stackoverflow.com/q/18760281)
- [How to set up tmux so that it starts up with specified windows opened?](https://stackoverflow.com/q/5609192)
- [Getting back old copy paste behaviour in tmux, with mouse](https://stackoverflow.com/q/17445100)
- [tmux status bar configuration](https://stackoverflow.com/q/9628435)


Others

- [Aprende Tmux en Y minutos](https://learnxinyminutes.com/docs/es-es/tmux/)
