# riak-quick-deps

Clone Riak's deps locally

## Purpose

Are you tired of hitting `github.com` every time you build Riak? Using the scripts and configuration here, you can mirror the dependent repositories used in Riak and Riak EE builds and clone from those.

## Installation

```
git clone https://github.com/lukebakken/riak-quick-deps.git $HOME/repos
```

Replace `/home/lbakken/repos` in `$HOME/repos/git/config` with the value of `$HOME/repos`.

Then, run:

```
cd $HOME/repos
./clone.sh
```

## Usage

Building a Riak rel:

```
cd $HOME/src
git clone https://github.com/basho/riak.git
cd riak
git co riak-2.1.4
XDG_CONFIG_HOME="$HOME/repos" make locked-deps rel
```

## How it works

Support for the [`XDG_CONFIG_HOME`](https://github.com/git/git/commit/22ae029a1e0631570a2db5d030e5755f9be96eee) environment variable allows you to override the location of the `$HOME/.gitconfig` file.

By setting `XDG_CONFIG_HOME="$HOME/repos"`, `git` uses the config file located at `$HOME/repos/git/config`.

This config file tells `git` to use the local repository clones instead of `github.com` when cloning repositories, and this is picked up in the `make locked-deps` step.

Included scripts:

* `clone.sh` will clone the necessary repos to `$HOME/repos`
* `update.sh` periodically will update the repositories.

## Issues

If a dependency is missing from `riak-deps.txt`, you'll see an error like this:

```
Pulling setup from {git,"git://github.com/uwiger/setup.git",
                        "51ee7c9f64d2bbe9dcbb58c278e8fbfd4d0ca5e2"}
Cloning into 'setup'...
fatal: '/home/lbakken/repos/uwiger/setup.git' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

If you see that, check the `riak-deps.txt` file and if the URL is missing, add it (and open a PR here).
