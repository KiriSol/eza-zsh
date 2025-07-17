# Check the presence of eza in PATH
if ! (( $+commands[eza] )); then
  print "zsh-eza-plugin: eza not found on path. Please install eza before using this plugin." >&2
  return 1
fi

# Changing standard settings
if ! [[ -n "${EZA_DEFAULT_OPTS+x}" ]]; then
  export EZA_DEFAULT_OPTS=(
    '--git'
    '--header'
    '--group-directories-first'
    '--sort=type'
    '--time-style=long-iso'
  )
fi

if ! [[ -n "${EZA_IGNORE_GLOB+x}" ]]; then
  export EZA_IGNORE_GLOB=".git|.venv|venv|node_modules|__pycache__|.idea|.buildozer|.ruff_cache"
fi

# Standard aliases
alias ls="eza $EZA_DEFAULT_OPTS"
alias tree='ls --tree'

alias la='ls --sort=Name --all'
alias l='ls --header --long'
alias ll='l --all'

# Full information about files
alias lla='ls -lbhHigUmuSa'
alias llx='ls -lbhHigUmuSa@'

# ls with sorting
alias lgit='ls -a --git-ignore'
alias lmod='ll --sort=modified'
alias lcreate='ll --sort=created'
alias lsize='ll --sort=size'
alias ldirs='ls --only-dirs'
alias lfiles='ls --only-files'

# Tree with level (first argument)
function lt() {
  if [ $ARGC -eq 0 ]; then
    1="1"
  fi
  if [ $ARGC -eq 1 ]; then
    2="."
  fi
  tree --level="$1" "${@:2}"
}

# Aliases for tree
alias lt1='tree --level=1'
alias lt2='tree --level=2'
alias lt3='tree --level=3'

alias ls1='lt1'
alias ls2='lt2'
alias ls3='lt3'

# Others
alias lT="ls --tree --no-user --all --ignore-glob='$EZA_IGNORE_GLOB'"
alias lS='ls --oneline'
alias lX='ls --across'
alias lR='ls --recurse'

alias labs='ls --absolute=on'
alias lpwd='labs -d .'

return 0
