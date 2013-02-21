#!/bin/sh

echo "Hit any key once you have installed XCode command line utils..."
read $DUMMY

if [ ! -f /usr/local/bin/brew ]; then
  echo 'Installing Homebrew'
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
  brew doctor
  brew update
fi

if [ ! -f /usr/bin/git ]; then
  echo 'Installing git'
  brew install git
fi

echo 'Getting your settings repo'
mkdir -p johnify_tmp
git clone https://github.com/remotezygote/settings.git johnify_tmp
pushd johnify_tmp
  echo 'Making this computer rock'
  ./setup.sh
popd