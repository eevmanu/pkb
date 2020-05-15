## Basics

for pair programming in a ssh

```bash
# run tmux
tmux
# ctrl+b - means this is for tmux not for shell
# ctrl+b c - new window
# ctrl+b , - change name on current window
# ctrl+b p - change to previous window - circle behaviour
# ctrl+b n - change to next window - circle behaviour
# ctrl+b w - list windows and can select
# ctrl+b " - split horizontal current pane
# ctrl+b % - split vertical current pane
# ctrl+b : split-window - split horizontal current pane
# ctrl+b {n} - n is a number - go to window "n"
# ctrl+b d - dettach session
# ctrl+b [ - scroll in tmux session

# create a new session with name {name}
tmux new -s {name}
# ctrl+b d - detached session

# list sessions
tmux ls
tmux list-s
tmux list-sessions

# attach to a session named {name}
tmux a -t {name}
tmux attach -t {name}
```




### Resources

- [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058)
- [tmux cheat sheet](https://gist.github.com/andreyvit/2921703)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Persists tmux environment across system restarts.
- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [.tmux](https://github.com/gpakosz/.tmux) - Oh My Tmux! Pretty & versatile tmux configuration
