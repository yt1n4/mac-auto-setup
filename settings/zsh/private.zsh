# zplug setting
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export LANG=ja_JP.UTF-8
# gcc のパスの関係で順番を入れ替える
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# git を homebrew で管理
export PATH=/usr/local/git/bin:$PATH

# プロンプト表示をカレントのみにする
export PS1='%F{1}%m%f:%F{6}%c%f $ '

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# node
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# color
autoload -Uz colors
colors

# compinit
autoload -Uz compinit
compinit

setopt share_history
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTIGNORE='?:??:???:exit'
HISTSIZE=100000
SAVEHIST=100000

# historyコマンドは履歴に登録しない
setopt hist_no_store
# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

alias ltr='ls -ltr -G'
alias lat='ls -lat -G'
alias l='ls -ltr -G'
alias la='ls -la -G'
alias ll='ls -l -G'
alias ls='ls -G'
alias lr='ls -R'

alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

zplug load

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2
function mkcd(){mkdir -p $1 && cd $1}

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# delete (not backspace)
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# R lang を優先するため、r コマンドを無効にする
disable r

# brew 時に python config 回避
alias brew="env PATH=${PATH/\/usr\/local\/var\/pyenv\/shims:/} brew"


. ~/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh
# conda activate base


# file open alias 系
alias coteditor='open $1 -a "/Applications/CotEditor.app"'


