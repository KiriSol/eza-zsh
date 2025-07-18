# eza-zsh plugin

This is a useful [eza](https://github.com/eza-community/eza) aliases for
[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

## installation

1. [Install](https://github.com/eza-community/eza/blob/main/INSTALL.md) eza

2. Clone this plugin to your plugins folder

```sh
git clone https://github.com/KiriSol/eza-zsh  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/eza-zsh
```

3. Add the plugin to list in `~/.zshrc`:

`plugins=(... eza-zsh ...)`

## Features

- ### The plugin introduces some variables
  - **EZA_DEFAULT_OPTS** defines the options that apply to **all aliases**. By default it is

  ```sh
  export EZA_DEFAULT_OPTS=(
    '--git'
    '--header'
    '--group-directories-first'
    '--sort=type'
    '--time-style=long-iso'
  )
  ```

  - **EZA_IGNORE_GLOB** pattern for `--ignore-glob` option, which is used for alias `lT`. By default it is

  ```sh
  export EZA_IGNORE_GLOB=".git|.venv|venv|node_modules|__pycache__|.idea|.buildozer|.ruff_cache"
  ```

- ### Table of aliases

| Alias     | Command                                                      |
| --------- | ------------------------------------------------------------ |
| `ls`      | `eza $EZA_DEFAULT_OPTS`                                      |
| `tree`    | `ls --tree`                                                  |
| `la`      | `ls --sort=Name --all`                                       |
| `l`       | `ls --header --long`                                         |
| `ll`      | `l --all`                                                    |
| `lla`     | `ls -lbhHigUmuSa`                                            |
| `llx`     | `ls -lbhHigUmuSa@`                                           |
| `lgit`    | `ls -a --git-ignore`                                         |
| `lmod`    | `ll --sort=modified`                                         |
| `lcreate` | `ll --sort=created`                                          |
| `lsize`   | `ll --sort=size`                                             |
| `ldirs`   | `ls --only-dirs`                                             |
| `lfiles`  | `ls --only-files`                                            |
| `lT`      | `ls --tree --no-user --all --ignore-glob='$EZA_IGNORE_GLOB'` |
| `lS`      | `ls --oneline`                                               |
| `lX`      | `ls --across`                                                |
| `lR`      | `ls --recurse`                                               |
| `labs`    | `ls --absolute=on`                                           |
| `lpwd`    | `labs -d .`                                                  |
| `ls1`     | `tree --level=1`                                             |
| `ls2`     | `tree --level=2`                                             |
| `ls3`     | `tree --level=3`                                             |

- ### Functions
  - `lt`. This is a `tree` with level accepted by the first argument
    ```sh
    function lt() {
      if [ $ARGC -eq 0 ]; then
        1="1"
      fi
      if [ $ARGC -eq 1 ]; then
        2="."
      fi
      tree --level="$1" "${@:2}"
    }
    ```

## Configuration

- You can change `EZA_DEFAULT_OPTS` and `EZA_IGNORE_GLOB` before load this plugin
