#!/bin/sh

BASEDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ln -sf "$BASEDIR/.ideavimrc" $HOME/.ideavimrc
