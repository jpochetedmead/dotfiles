chadoh's dotfiles
======================

These are dotfiles that are generic enough to use on servers and
delightful enough for developers to get comfy.

To get started, clone the repo, `cd` into it, and run `./setup.sh`

.extra
------

You should make a `~/.extra`, which will be sourced by bash. You can use this
to add custom configs. Most importantly, **this is where your git credentials
are stored**, to prevent needing to hard-code this info into the repo.

Your `~/.extra` might look something like:

```bash
# PATH additions
export PATH="~/.rbenv/bin:~/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

# Ruby version manager
eval "$(rbenv init -)"

# Git credentials
# Not in the repository, so people don't commit as the wrong person
GIT_AUTHOR_NAME="Chad Ostrowski"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="hi@chadoh.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

git config --global github.user chadoh
```

vim
---

For the vim setup to work, you first need to install [vim-plug] by running

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Then once you start vim, install all the plugins by running `:PlugInstall`.

  [vim-plug]: https://github.com/junegunn/vim-plug

