alias config='/usr/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME'
config config --local state.showUntrackedFiles no

alias docl='docker rm -v $(docker ps -a -q -f status=exited)'
