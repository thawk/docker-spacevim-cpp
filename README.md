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
  
  cache_home="${XDG_CACHE_HOME:-${HOME}/.cache}"
  data_home="${XDG_DATA_HOME:-${HOME}/.local/share}"
  shada_path="${data_home}/nvim/shada"
  
  mkdir -p "${cache_home}"/{neomru,neoyank}
  mkdir -p "${cache_home}"/SpaceVim/{backup,swap,tags,undofile}
  
  if [[ ! -d "${shada_path}" ]]
  then
      mkdir -p "${shada_path}"
      chmod 700 "${shada_path}"
  fi
  
  docker run --rm \
      -it \
      -P \
      -u $(id -u ${USER}):$(id -g ${USER}) \
      -v "${HOME}":"${HOME}" \
      -v "${cache_home}/SpaceVim/backup":"/myhome/.cache/SpaceVim/backup" \
      -v "${cache_home}/SpaceVim/swap":"/myhome/.cache/SpaceVim/swap" \
      -v "${cache_home}/SpaceVim/tags":"/myhome/.cache/SpaceVim/tags" \
      -v "${cache_home}/SpaceVim/undofile":"/myhome/.cache/SpaceVim/undofile" \
      -v "${cache_home}/neomru":"/myhome/.cache/neomru" \
      -v "${cache_home}/neoyank":"/myhome/.cache/neoyank" \
      -v "${data_home}/nvim/shada":"/myhome/.local/share/nvim/shada" \
      -w "${PWD}" \
      "${docker_image}" \
      -- "$@"
  ```

  It will mount your home to the corresponded path, and mount some key directory of ``SpaceVim`` to work like locally.

* usage

  ```sh
  dvim path/to/file.txt
  ```

* Or you can simply run it:

  ```sh
  $ docker run -it --rm -v $(pwd):/src thawk/spacevim-cpp test.cpp
  ```

