#!/bin/bash

## this file is created by lvhiei, some software that can be installed by shell


## homebrew
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

## wget 
brew install wget

## ag
brew install ag

## ctags && cscope
brew install ctags
brew install cscope

## java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

## cmake 
brew install cmake

## ffmpeg 
brew install ffmpeg
