# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lk='ls -lSr'		# Sort by size, biggest last.
alias lr='ls -ltr'		# Sort by date, most recent last.
alias lc='ls -ltcr'		# Sort by/show change time, most recent last.
alias lld="ls -alF | grep --color=auto '^d'"	# List only directories

# Always enable colored 'grep' output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export CLICOLOR=1



alias config='/usr/local/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME'
config config --local status.showUntrackedFiles no
