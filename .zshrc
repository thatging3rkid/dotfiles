# Set up the prompt
autoload -Uz promptinit
autoload -U colors && colors
promptinit
prompt off

setopt histignorealldups

# Configure history settings
HISTSIZE=9999
SAVEHIST=9999
HISTFILE=~/.zsh_history

# Set zle bind mode to emacs, the most popular
bindkey -e

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
unsetopt nomatch

# Shell customization
prompt_append=""
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
    prompt_append="%{%F{green}%}r%{%F{white}%}+"
fi
export PROMPT=${prompt_append}'%{%F{cyan}%}%n%{%F{white}%}@%{%F{magenta}%}%m%{%F{white}%}:%~ %# '

# Command aliases
alias l="/bin/ls -aCF"
alias ls="/bin/ls -lash --color"
alias cpu-time="time"
alias time="date +"%r""
alias gdb="gdb -q"
#alias less="/bin/less -Nr"
cld() { cd "$@" && ls -lash --color }
incognito() { unset HISTFILE }
alias strip-m="sed -i -e 's/\r//g'"
alias expand-tts="sed -i -e $'s/\t/    /g'"
llss() { /bin/ls -lash --color=never "$@" | less }

# Change default editor
export EDITOR=micro
export PATH=$PATH:$HOME/bin

# Add support for X11 forwarding
#export DISPLAY=127.0.0.1:0 # DISPLAY will be set by WM if physically logging in or by ssh if remoting (use -X)

export LANG=en_US.UTF-8 # set language to english with UTF-8
