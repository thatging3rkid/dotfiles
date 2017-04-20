# add the RIT default bashrc stuff
source /usr/local/lib/config/Bash_Profile

# Set up the prompt
autoload -Uz promptinit
autoload -U colors && colors
promptinit
prompt off

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
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

# Shell customization
export PROMPT='%{%F{cyan}%}%n%{%F{white}%}@%{%F{magenta}%}%m%{%F{white}%}:%~ %# '

# Now, some personal aliases
alias ls="ls -lash --color"
alias dir="ls -lash --color"
alias cpu-time="time"
alias time="date +"%r""

# Last thing, needs to be zsh-syntax
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Change default editor
export EDITOR=nano
