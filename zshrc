#普通命令提示符，在控制台下可以正常显示，如需使用取消注释，并把底部有关提示符的语句注释掉
##RPROMPT='%/'
#PROMPT='%{[36m%}%n%{[35m%}@%{[34m%}%M %{[33m%}%D %T  %{[32m%}%/ 
#%{[31m%}>>%{[m%}'
#
#fcitx  chinese input
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim



#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=10000
# # number of lines saved in the history after logout
export SAVEHIST=10000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

#Disable core dumps
limit coredumpsize 0
#autocd 
setopt autocd
#Emacs风格键绑定
bindkey -e
#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias clpyc='rm *.pyc -rf'
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias l='ls'
alias grep='grep --color=auto'
alias ee='emacsclient -t'
alias vim='vim -n'
alias gv='gvim'
alias gvim='gvim -n'
alias vi='vim'
alias la="ls -a"
alias cl="clear"
alias wi='whoami'
alias et='exit'

#webbrowsers
alias f='firefox'
alias ch='google-chrome'

#sublime
#alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"
#alias nano="subl"
#export EDITOR="subl"
#
#git
alias gitaa='git add . && git commit -a'
alias gitp='git push origin '

# python simple web servser
#
alias py123="python -m SimpleHTTPServer 1234"


#Colordiff
alias diff='colordiff'

#deepin-screenshot
alias deepin-scrot='cd /home/zhwei/apps/deepin-screenshot/src && ./screenshot.py'

#xunlei-lixian
alias lx='python2.7 /home/zhwei/apps/xunlei-lixian/lixian_cli.py'
alias lxl='python2.7 /home/zhwei/apps/xunlei-lixian/lixian_cli.py list -n'
alias lxd='python2.7 /home/zhwei/apps/xunlei-lixian/lixian_cli.py download'
#baidu music downloader
alias bmd='python2.7 /home/zhwei/apps/baidu_music/getBaiduMusic.py -d ~/Music'

# ranger
alias r='ranger'

##python
   alias py='python'
   alias ipy='ipython2.7'
   alias bpy='bpython'

#goagent start
alias goagent='python2.7 /home/zhwei/Dropbox/tools/goagent/local/proxy.py'

# shadowsocks
alias ssjp='sslocal -c /home/zhwei/apps/shadowsocks/config.json'

#ssh proxy #openshift
alias proxy_ssh='ssh -qTfnN -D 7070 89e18343a9774201a7dc87dfbead0a81@diy-zhwei.rhcloud.com'
alias ssh_open='ssh ea99d068814f4787a8fe179724d58b0e@dytt-zhwei.rhcloud.com'
alias sshvps='ssh -qTfnN -D 7777 zhwei@173.252.197.142'
alias sshjp1='ssh -qTfnN -D 7777 zhwei@zhangweide.cn'

#xiaonei
alias xiaonei='ssh -qTfnN -D 7070 group@210.44.176.241 -p 80'

#xiaonei3
alias xiao3='ssh -qTfnN -D 7070 group@211.64.30.55 -p 22'

#virtualenv
alias ac_env="source env/bin/activate"

#路径别名 进入相应的路径时只要 cd ~xxx
hash -d E="/etc/env.d"
hash -d C="/etc/conf.d"
hash -d D="/home/zhwei/Dropbox"
hash -d I="/etc/rc.d"
hash -d X="/etc/X11"
hash -d Y="/home/zhwei/Yunio"
hash -d W="/var/www"
hash -d J="/home/zhwei/apps/jekyll_blog/"
hash -d V="/home/bak/vmbox"
hash -d B="/home/bak"
hash -d G="/home/bak/apps/gotit/"

##for Emacs在Emacs终端中使用Zsh的一些设置 不推荐在Emacs中使用它
if [[ "$TERM" == "dumb" ]]; then
setopt No_zle
PROMPT='%n@%M %/
>>'
alias ls='ls -F'
fi 



#ibus


 export GTK_IM_MODULE=ibus
 export XMODIFIERS=@im=ibus
   export QT_IM_MODULE=ibus


#效果超炫的提示符，如需要禁用，注释下面配置   
function precmd {
    
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    
    ###
    # Truncate the path if it's too long.
    
    PR_FILLBAR=""
    PR_PWDLEN=""
    
    local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}
    
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi
    
    ###
    # Get APM info.
    
    #if which ibam > /dev/null; then
    #PR_APM_RESULT=`ibam --percentbattery`
    #elif which apm > /dev/null; then
    #PR_APM_RESULT=`apm`
    #fi
}


setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"
    fi
}

setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst
    

    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"
    
    
    ###
    # See if we can use extended characters to look nicer.
    
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    #PR_HBAR=" "
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}
    
    
    ###
    # Decide if we need to set titlebar text.
    
    case $TERM in
    xterm*)
        PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
        ;;
    screen)
        PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
        ;;
    *)
        PR_TITLEBAR=''
        ;;
    esac
    
    
    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
    PR_STITLE=$'%{\ekzsh\e\\%}'
    else
    PR_STITLE=''
    fi
    
    
    ###
    # APM detection
    
    #if which ibam > /dev/null; then
    #PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
    #elif which apm > /dev/null; then
    #PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
    #else
    PR_APM=''
    #fi
    
    
    ###
    # Finally, the prompt.
    
    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m:%l\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR${(e)PR_FILLBAR}$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_MAGENTA%$PR_PWDLEN<...<%~%<<\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_URCORNER$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_BLUE:)\
${(e)PR_APM}$PR_YELLOW%D{%H:%M}\
$PR_LIGHT_BLUE:%(!.$PR_RED.$PR_WHITE)%#$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_NO_COLOUR '
    
    RPROMPT=' $PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
($PR_YELLOW%D{%a,%b%d}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'
    
    PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

#命令粗体
#color{{{
autoload colors
colors
 
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
#}}}


 
#漂亮又实用的命令高亮界面
setopt extended_glob
 TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
 
 recolor-cmd() {
     region_highlight=()
     colorize=true
     start_pos=0
     for arg in ${(z)BUFFER}; do
         ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
         ((end_pos=$start_pos+${#arg}))
         if $colorize; then
             colorize=false
             res=$(LC_ALL=C builtin type $arg 2>/dev/null)
             case $res in
                 *'reserved word'*)   style="fg=magenta,bold";;
                 *'alias for'*)       style="fg=cyan,bold";;
                 *'shell builtin'*)   style="fg=yellow,bold";;
                 *'shell function'*)  style='fg=green,bold';;
                 *"$arg is"*)
                     [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                 *)                   style='none,bold';;
             esac
             region_highlight+=("$start_pos $end_pos $style")
         fi
         [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
         start_pos=$end_pos
     done
 }
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
 check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
 
 zle -N self-insert check-cmd-self-insert
 zle -N backward-delete-char check-cmd-backward-delete-char


#go config
#export GOROOT = /usr/local/lib/go
#export GOARCH = amd64
#export GOOS = linux
#export GOBIN = /usr/local/lib/go/bin 