[![](https://images.microbadger.com/badges/image/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp) [![](https://images.microbadger.com/badges/commit/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp) [![](https://images.microbadger.com/badges/version/thawk/spacevim-cpp.svg)](https://microbadger.com/images/thawk/spacevim-cpp)

A neovim with [SpaceVim](https://spacevim.org) and [my customized configuration](https://github.com/thawk/dotspacevim).

https://hub.docker.com/r/thawk/spacevim-cpp

Based on: https://hub.docker.com/r/thawk/spacevim-base

## Usage

You can use the ``dvim`` script to mount ``$HOME`` and use this image to edit you file like using a local VIM.

* ``dvim``

  ```sh
  #!/bin/bash
  # Command for running neovim
  
  docker_image=thawk/spacevim-cpp
  
  umask 022
  
  mkdir -p "${HOME}/.cache/SpaceVim"
  mkdir -p "${HOME}/.local/share/nvim"
  
  docker run --rm \
      -it \
      -P \
      -u $(id -u ${USER}):$(id -g ${USER}) \
      -v "${HOME}":"${HOME}" \
      -v "${HOME}/.cache/SpaceVim/backup":"/myhome/.cache/SpaceVim/backup" \
      -v "${HOME}/.cache/SpaceVim/swap":"/myhome/.cache/SpaceVim/swap" \
      -v "${HOME}/.cache/SpaceVim/tags":"/myhome/.cache/SpaceVim/tags" \
      -v "${HOME}/.cache/SpaceVim/undofile":"/myhome/.cache/SpaceVim/undofile" \
      -w "${PWD}" \
      "${docker_image}" \
      -- "$@"
  
      # -v "${HOME}/.local/share/nvim":"/myhome/.local/share/nvim" \
  ```

  It will mount your home to the corresponded path, and mount some key directory of ``SpaceVim`` to work like locally.

* usage

  ```sh
  dvim some/file.txt
  ```

* Or you can simply run it:

  ```sh
  $ docker run -it --rm -v $(pwd):/src thawk/spacevim-cpp test.cpp
  ```

