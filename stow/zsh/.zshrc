# Jovan Lanik's zsh config 1.0
# www.github.com/jovanlanik
# clean and simple

[ -z "$XDG_CACHE_HOME" ] && XDG_CACHE_HOME="$HOME/.cache"
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"

autoload -Uz compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh"
bindkey -e

PROMPT="%F{1}%n %F{4}%M%f "
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
export PATH="${PATH:+$PATH:}$HOME/.local/bin"
export EDITOR="vim"
export PAGER="less"
export LESS="-R"
export LESSHISTFILE=-
export LESS_TERMCAP_mb=$'\C-[[0;31m'
export LESS_TERMCAP_md=$'\C-[[0;31m'
export LESS_TERMCAP_me=$'\C-[[0m'
export LESS_TERMCAP_se=$'\C-[[0m'
export LESS_TERMCAP_so=$'\C-[[01m'
export LESS_TERMCAP_ue=$'\C-[[0m'
export LESS_TERMCAP_us=$'\C-[[0;34m'
export LESS_TERMCAP_zz=$'\C-[[0m'
export GREP_COLORS='ms=0;33'
export LS_COLORS="di=31:fi=34:ln=33:pi=0:so=0:bd=35:cd=35:or=0:mi=0:ex=32:*=34"
zstyle ':completion:*'		group-name	''
zstyle ':completion:*'		format		"%F{7}%d%f"
zstyle ':completion:*'		list-colors	$LS_COLORS
zstyle ':completion:*:commands'	list-colors	'=*=32'
zstyle ':completion:*:aliases'	list-colors	'=*=33'
zstyle ':completion:*:builtins'	list-colors	'=*=36'

function become()
{
	if command -v $1
	then
		if test $DISPLAY
		then
			$* & disown
			exit
		else
			exec $*
		fi
	else
		$1
	fi
}

function _become() { _arguments -s -S -A '-*' : '*:: : _normal' }
compdef _become become

alias be="become "
alias usv="SVDIR=$XRUNIT_SESSION/service sv"
alias q="exit"
alias da="keepas "
alias watch="watch -tcn1 "
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ls="ls --color=auto"
alias la="ls -a"
alias lh="ls -d .*"
alias lls="ls -l"
alias lla="la -l"
alias llh="lh -l"
alias startx=xrunit
