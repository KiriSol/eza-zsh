# Проверяем наличие eza
if ! (( $+commands[eza] )); then
    print "zsh-eza-plugin: eza not found on path. Please install eza before using this plugin." >&2
    return 1
fi

export EZA_ALIASES="$ZSH_CUSTOM/plugins/eza-zsh/eza-zsh.plugin.zsh"

# Старый ls просто по приколу
alias lss="$(dirname $(command -v cat))/ls --color=auto" # Не на всех платформах это /usr/bin/ls

# Изменение стандартных настроек
eza_params=(
    '--git'                     # Информация о git status
    '--hyperlink'               # Гиперссылки на открытие программой по умолчанию
    '--color=always'            # Все цвета
    '--icons=always'            # Все иконки
    '--group-directories-first' # Сначала директории
    '--sort=type'               # Сортировка по типу
    '--time-style=long-iso'     # Стиль времени
    '--header'                  # Названия столбцов информации
    '--classify=always'         # Подсказки по типу элемента
)

# Стандартные aliases
alias ls='eza $eza_params' # Переопредиление ls
alias tree='ls --tree'     # Переопредиление tree

alias la='ls --sort=Name --all' # Cо скрытыми элементами
alias l='ls --header --long'    # Больще информации о файлах
alias ll='l --all'
alias lsa='ll' # Со скрытыми элементами

# Полная информация о файлах
alias lla='ls -lbhHigUmuSa'
alias llx='ls -lbhHigUmuSa@'

# ls with sorting
alias lgit='ls -a --git-ignore'      # Без файлов и директорий, обозначенных в .gitignore
alias lmod='ll --sort=modified'   # Сортировка по дате модификации
alias lcreate='ll --sort=created' # Сортировка по дате создания
alias lsize='ll --sort=size'      # Сортировка по размеру
alias ldir='ls --only-dirs'       # Только директории
alias lfile='ls --only-files'     # Только файлы

alias labs='ls --absolute=on' # Абсолютный путь
alias lpwd='labs -d .'        # Красивая замена pwd

# Добавленные
alias lT='ls --tree --no-user --all --ignore-glob=.git' # Дерево файлов со скратыми элементами
alias lS='ls --oneline'              # В один столбик
alias lX='ls --across'               # Вывод не по столбам, а по строкам
alias lR='ls --recurse'              # рекурсия по вложенным директориям

# Дерево по указанному уровню
function lt() {
    if [ $ARGC -eq 0 ]; then # Проверяем наличие первого аргумента
        1="1"
    fi
    if [ $ARGC -eq 1 ]; then # Аналогично с вторым
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
