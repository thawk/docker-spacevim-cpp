[![](https://images.microbadger.com/badges/image/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp) [![](https://images.microbadger.com/badges/commit/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp) [![](https://images.microbadger.com/badges/version/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp)

A neovim with [SpaceVim](https://spacevim.org) and [my customized configuration](https://github.com/thawk/dotspacevim).

https://hub.docker.com/r/thawk/spacevim-cpp

Based on: https://hub.docker.com/r/thawk/spacevim-base

## Usage

You can use the ``dvim`` script to mount ``$HOME`` and use this image to edit you file like using a local VIM.

```sh
$ docker run -it --rm -v $(pwd):/src thawk/spacevim-cpp test.cpp
```

```sh
alias dnvim='docker run -it --rm -v $(pwd):/src thawk/spacevim-cpp "$@"'
```

