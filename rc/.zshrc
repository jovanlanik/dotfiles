# Jovan Lanik's zsh config 1.0
# www.github.com/jovanlanik
# clean and simple

autoload -Uz compinit
mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump

PROMPT="%F{1}%n %F{4}%M%f "
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
typeset -U path
path+=(~/.local/bin)
export PATH
bindkey -e
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

alias be="become"
alias q="exit"
alias sudo="sudo -E "
alias watch="watch -tcn1 "
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ls="ls --color=auto"
alias la="ls -a"
alias lh="ls -d .*"
alias lls="ls -l"
alias lla="la -l"
alias llh="lh -l"
