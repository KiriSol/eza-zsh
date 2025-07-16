# Проверяем наличие eza
if ! (( $+commands[eza] )); then
  print "zsh-eza-plugin: eza not found on path. Please install eza before using this plugin." >&2
  return 1
fi

export EZA_ALIASES="${0:a}"

# Изменение стандартных настроек
if ! [[ -n "${EZA_DEFAULT_OPTS+x}" ]]; then
  export EZA_DEFAULT_OPTS=(
    '--git'                        # Информация о git status
    '--hyperlink'                  # Гиперссылки на открытие программой по умолчанию
    '--color=always'               # Все цвета
    '--icons=always'               # Все иконки
    '--group-directories-first'    # Сначала директории
    '--sort=type'                  # Сортировка по типу
    '--time-style=long-iso'        # Стиль времени
    '--header'                     # Названия столбцов информации
    '--classify=always'            # Подсказки по типу элемента
    '--colour-scale-mode=gradient' # 
    '--color-scale=all'            # 
  )
fi

# Стандартные aliases
alias ls="eza $EZA_DEFAULT_OPTS" # Переопредиление ls
alias tree='ls --tree'     # Переопредиление tree

alias la='ls --sort=Name --all' # Cо скрытыми элементами
alias l='ls --header --long'    # Больще информации о файлах
alias ll='l --all'

# Полная информация о файлах
alias lla='ls -lbhHigUmuSa'
alias llx='ls -lbhHigUmuSa@'

# ls with sorting
alias lgit='ls -a --git-ignore'      # Без файлов и директорий, обозначенных в .gitignore
alias lmod='ll --sort=modified'   # Сортировка по дате модификации
alias lcreate='ll --sort=created' # Сортировка по дате создания
alias lsize='ll --sort=size'      # Сортировка по размеру
alias ldirs='ls --only-dirs'       # Только директории
alias lfiles='ls --only-files'     # Только файлы

alias labs='ls --absolute=on' # Абсолютный путь
alias lpwd='labs -d .'        # Красивая замена pwd

# Добавленные
alias lT='ls --tree --no-user --all --ignore-glob=.git' # Дерево файлов со скратыми элементами
alias lS='ls --oneline'              # В один столбик
alias lX='ls --across'               # Вывод не по столбам, а по строкам
alias lR='ls --recurse'              # рекурсия по вложенным директориям

# Дерево по указанному уровню
function lt() {
  if [ $ARGC -eq 0 ]; then
    1="1"
  fi
  if [ $ARGC -eq 1 ]; then
    2="."
  fi
  tree --level="$1" "${@:2}"
}

# Tree with level
alias lt1='tree --level=1'
alias lt2='tree --level=2'
alias lt3='tree --level=3'

alias ls1='lt1'
alias ls2='lt2'
alias ls3='lt3'

return 0
