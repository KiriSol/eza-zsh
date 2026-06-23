# eza-zsh plugin

This is a useful [eza](https://github.com/eza-community/eza) aliases for
[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

## installation

1. [Install](https://github.com/eza-community/eza/blob/main/INSTALL.md) eza

2. Clone this plugin to your plugins folder

```sh
git clone https://github.com/KiriSol/eza-zsh ${ZSH_CUSTOM:-$ZSH/custom}/plugins/eza-zsh
```

3. Add the plugin to list in `~/.zshrc`:

`plugins=(... eza-zsh ...)`

## Features

- ### The plugin introduces some variables
  - **EZA_DEFAULT_OPTS** defines the options that apply to **all aliases**. By default it is

  ```bash
  export EZA_DEFAULT_OPTS=(
    '--git'
    '--header'
    '--group-directories-first'
    '--sort=type'
    '--time-style=long-iso'
  )
  ```

## Configuration

- You can change `EZA_DEFAULT_OPTS` and before loading this plugin
