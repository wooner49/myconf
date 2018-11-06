# git aliases for config
alias config='/usr/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME'
config config --local status.showUntrackedFiles no


# docker aliases
alias docl='docker rm -v $(docker ps -a -q -f status=exited)'


# svn aliases
svnl()
{
	svn log -v $1 | less
}
svnlr()
{
	svn log -v -r$1
}
svndiff()
{
	svn diff $1 | less
}
svnc()
{
	svn diff -c$1
}
svnle()
{
	svn propedit svn:log --revprop -r $1 --editor-cmd vim
}

