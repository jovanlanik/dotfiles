# Jovan Lanik's zsh config 1.0
# www.github.com/jovanlanik
# clean and simple

autoload -Uz compinit
mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump

PROMPT="%F{1}%n %F{4}%M%f "
typeset -U path
path+=(~/bin)
export PATH
export LS_COLORS="di=31:fi=34:ln=33:pi=0:so=0:bd=35:cd=35:or=0:mi=0:ex=32:*=34"
zstyle ':completion:*'		group-name	''
zstyle ':completion:*'		format		"%F{7}%d%f"
zstyle ':completion:*'		list-colors	$LS_COLORS
zstyle ':completion:*:commands'	list-colors	'=*=32'
zstyle ':completion:*:aliases'	list-colors	'=*=33'
zstyle ':completion:*:builtins'	list-colors	'=*=36'

alias q="exit"
alias ls="ls --color=auto"
alias la="ls -a"
alias lh="ls -d .*"
alias lls="ls -l"
alias lla="la -l"
alias llh="lh -l"
