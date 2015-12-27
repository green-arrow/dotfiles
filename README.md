# My dotfiles

> Your dotfiles are how you personalize your system. These are mine.

This repo was forked from https://github.com/holman/dotfiles and I've customized it to suit my needs. Head over to the base repo to read up on how this project is logically organized.

## Differences

The main differences in this repo are:

* Using [antigen](https://github.com/zsh-users/antigen) for ZSH plugin management
* Customized OS X defaults
  - Added many additional defaults from https://github.com/zhimsel/dotfiles
* Added a few new brew / cask packages
* Set up with NVM and using Node 4.x by default
* Using my own [customized theme for Sublime Text 3](https://github.com/green-arrow/fengshui-theme)

## install

Run this:

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## thanks

I forked [Zach Holman's](https://github.com/holman)' awesome
[dotfiles](http://github.com/holman/dotfiles) because I really liked the "topical" layout approach that he had created. This made creating new sections (such as the one for Sublime Text) trivial to do.

Also thanks to [Zach Himsel](https://github.com/zhimsel), as I saw a post he made on Reddit that turned me on to this whole "Dotfiles" thing, which I had never heard of before. I also took pretty much all of his OS X defaults and integrated them into the defaults in this project.
