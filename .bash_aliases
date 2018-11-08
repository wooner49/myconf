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


# git aliases
alias gb='git branch'
alias gbr='git branch -r'
alias gba='git branch -a'
alias gbv='git branch -v'
alias gg='git g'
alias gg2='git g2'
alias gs='git status'


# Tibero aliases
alias 5m='cd $TB_BRANCHES/5; tb;'                                              
alias 6m='cd $TB_BRANCHES/6; tb;'                                              
alias 7m='cd $TB_BRANCHES/7; tb;'  
