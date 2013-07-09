#!/bin/bash
INSTRUCTIONS="You can probably just run this, on a mac.  By default, it assumes that:

 * you're running this on your local machine, which you'd like to nickname
   'local'. If not, you can nickname it something else by setting -n
 * you're running this file from within the directory where it's saved.
   If not, set -s with the correct source directory.
 * you're running this file on an osx-like system where user
   directories are stored in '/Users'. If not, set -d with the correct user
   directory path (don't include the actual folder at the end, that's
   the next option)
 * you're running this file to set up your own stuff (that is, you're
   running it as the user you're setting up). If not, you'll need to set
   -u with the correct username.

You can also run it with -q for quiet-mode (no output on success)."

SRC=$PWD
USER_DIR="/Users"
USER=`whoami`
NICK="local"

# options with a colon after them expect an
# argument, which is stored in $OPTARG
while getopts ":s:d:u:n:q" opt; do
  case $opt in
    s)
      # assign a's value to a variable
      SRC="$OPTARG"
      ;;
    d)
      USER_DIR="$OPTARG"
      ;;
    u)
      USER="$OPTARG"
      ;;
    n)
      NICK="$OPTARG"
      ;;
    q)
      QUIET=true
      ;;
    ?)
      echo "$INSTRUCTIONS"
      exit
      ;;
  esac
done

n=1
while [ $# -gt 0 ]; do
  if [ $n -lt $OPTIND ]; then
    # remove (shift) option arguments
    # until they are all gone
    let n=$n+1
    shift
  else
    break;
  fi
done

if [ $# -gt 0 ]; then
  echo "$INSTRUCTIONS"
  exit
fi

## WHERE IT ALL GOES DOWN
echo "$NICK" > $USER_DIR/$USER/.machine_nickname

ln -fns $SRC/bash/bashrc $USER_DIR/$USER/.bashrc
ln -fns $SRC/bash/bash_profile $USER_DIR/$USER/.bash_profile
ln -fns $SRC/bash/functions $USER_DIR/$USER/.functions

rm $USER_DIR/$USER/.gitconfig
cp -f   $SRC/git/gitconfig $USER_DIR/$USER/.gitconfig
ln -fns $SRC/git/gitignore $USER_DIR/$USER/.gitignore

mkdir -p $USER_DIR/$USER/.vim-tmp/undo
ln -fns $SRC/vim/vimrc $USER_DIR/$USER/.vimrc

ln -fns $SRC/ack/ackrc $USER_DIR/$USER/.ackrc

ln -fns $SRC/ag/agignore $USER_DIR/$USER/.agignore
# AND THAT'S IT, REALLY

if [ -z $QUIET ]; then
  echo "Success! Check it out:"
  ls -l $USER_DIR/$USER/.machine_nickname $USER_DIR/$USER/.bashrc $USER_DIR/$USER/.bash_profile $USER_DIR/$USER/.functions $USER_DIR/$USER/.gitconfig $USER_DIR/$USER/.gitignore $USER_DIR/$USER/.vimrc $USER_DIR/$USER/.ackrc $USER_DIR/$USER/.agignore
  echo "
  Notice that .gitconfig is not symlinked, since your git username is set in .extra (see readme)"
fi
