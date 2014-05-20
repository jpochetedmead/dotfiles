PipelineDeals dotfiles
======================

These are dotfiles that are generic enough to use on servers and
delightful enough for developers to get comfy.

Machine Nickname
----------------

Since a big focus of these dotfiles is being able to use them on
various servers as well as locally, it's nice to have a machine name in
the prompt. However, the names of ec2 instances or even your own dev machine
are probably not the most useful or concise names to have in the prompt.

A rather nice solution is to create a `~/.machine_nickname` file, and read its
contents into the prompt.

The setup.sh script assumes a local, osx environment, and will thus nickname
your machine "local" unless you specify a `-n` flag with a different nickname.
Try running `./setup.sh -h` for more info.

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

For the vim setup to work, you first need to install [Vundle] by running

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then once you start vim, install all the plugins by running `:BundleInstall`.

  [Vundle]: https://github.com/gmarik/vundle

