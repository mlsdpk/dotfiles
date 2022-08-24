# My Personal Dotfiles

## Setting up on new machine

First add the following line into your .zshrc or .bashrc to allow git operations inside your .dotfiles directory with the git alias called `dotfiles`
```
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Then clone the repo to your machine
```
$ git clone --bare https://github.com/mlsdpk/dotfiles.git $HOME/.dotfiles
```
Since $HOME directory already has configuration files, we need to delete them or make a backup. The following command will move all the files into backup directory.
```
$ mkdir -p .config-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
Now checkout the actual content from the bare repository to your $HOME and set the flag `showUntrackedFiles` to `no`
```
$ dotfiles checkout
$ dotfiles config --local status.showUntrackedFiles no
```
