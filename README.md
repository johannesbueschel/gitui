# gitui

gitui is a git Terminal User Interface build upon the amazing [fzf](https://junegunn.github.io/fzf/).

It is an experiment on what is possible with a few shell scripts and some string processing. The look and feel was influenced by the wonderful macOS tool [GitUp](https://github.com/git-up/GitUp).


## Installation

You need to have fzf installed for this to work.

At the moment you can only clone the repository. Afterwards, you can run one of the following commands:

| Command              | Description |
| :---                 | :--- |
| `make install`       | Installs gitui by copying the files to `~/.local/bin`. |
| `make install-links` | Installs gitui by creating symbolic links of all files in `~/.local/bin`. |
| `make uninstall`     | Removes all files in `~/.local/bin` that match `gitui*`. |

You can run `gitui` in any folder that contains a repository.

If this gets 10 stars, I might look into making this available on Homebrew 😅


## Views

| View              | Screenshot |
| :---              | :--- |
| Main              | ![Main menu view](assets/gitui.png) |
| Working Directory | ![Working directory view](assets/gitui-working-directory.png) |
| Index             | ![Index view](assets/gitui-index.png) |
| Commit            | ![Index view](assets/gitui-commit.png) |
| Branch            | ![Branch view](assets/gitui-branch.png) |
| History           | ![History view](assets/gitui-history.png) |


## Shortcuts

The shortcuts below make the workflow as smooth as possible.

**Bonus:** Using `gitui` to switch branches, will automatically set your commit message template. Your branch naming just has to be of the form `<name>-<number>[...]` (yes, this also works with sub-branches like `subbranch/<name>-<number>[...]`).

| View              | Screenshot |
| :---              | :--- |
| Main              | 1-5: open the desired section<br>esc: end the programm |
| Working Directory | enter: stage file<br>ctrl-r: reload<br>tab/ctrl-i: switch to Index<br>ctrl-p: git patch the current file<br>ctrl-e: open file in the default editor<br>del: discard file |
| Index             | enter: unstage file<br>ctrl-p: restore file in patch mode<br>ctrl-r:reload<br>ctrl-w: switch to Working Directory<br>tab: switch to Commit<br>ctrl-c: commit directly<br>ctrl-a: amend directly |
| Commit            | 1: commit current index<br>2: amend current index<br>tab: switch to Working Directory |
| Branch            | enter: switch to selected branch<br>ctrl-r: show remote branches<br>ctrl-l: show local branches<br>ctrl-p: push currently selected branch (experimental)<br>del: delete branch<br>ctrl-del: force delete branch |
| History           | enter: show commits diff |


## Todos

So many ... an unordered list:

- Check if installation works on different machines
- Check if it works on Linux
- There is one script that is not in bash 😬 Look into it and make it a bash script
- More functionalities for branches (create branch)
- Stash support
- Match change state of files properly
