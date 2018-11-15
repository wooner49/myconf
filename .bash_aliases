# git aliases for config
alias config='/usr/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME'
config config --local status.showUntrackedFiles no


# docker aliases
alias docl='docker rm -v $(docker ps -a -q -f status=exited)'


# svn aliases
alias svnst="svn status | grep -e '[AMD] '"

svnl() { 
  svn log -v $1 | less
}
svnlr() {
	svn log -v -r$1
}
svndiff() {
	svn diff $1 | less
}
svnc() {
	svn diff -c$1
}
svnle() {
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
alias go='git checkout'


# Tibero aliases
export TB_DIR=$HOME/tibero
export TB_BRANCHES=$TB_DIR/branches
export REL5=$TB_BRANCHES/5_rel
export REL6=$TB_BRANCHES/6_rel

alias cdt='cd $TB_DIR'
alias cdtb='cd $TB_BRANCHES'
alias 5b='cd $REL5'
alias 5p='cd $REL5/patch'
alias 6b='cd $REL6'
alias 6p='cd $REL6/patch'
alias tb='. ./tbenv `pwd` tibero'
alias 5m='cd $TB_BRANCHES/5; tb; export LANG="ko_KR.EUC-KR"; export LC_ALL="ko_KR.EUC-KR";'
alias 6m='cd $TB_BRANCHES/6; tb; export LANG="ko_KR.EUC-KR"; export LC_ALL="ko_KR.EUC-KR";'
alias 7m='cd $TB_BRANCHES/7; tb; export LANG="ko_KR.UTF-8"; export LC_ALL="ko_KR.UTF-8";'
alias up='5p; svn up; 6p; svn up;'
alias gt='ps -ef | grep tbsvr;'

alias cdh='cd $TB_HOME'
alias cdi='cd $TB_HOME/instance/$TB_SID'
alias cdlog='cd $TB_HOME/instance/$TB_SID/log'
alias clst='cd $TB_HOME; svn revert -R *; $HOME/bin/clst.sh;'

alias vitip='vi $TB_HOME/config/$TB_SID.tip'
alias vidsn='vi $TB_HOME/client/config/tbdsn.tbr'
alias vissdsn='vi $TB_HOME/client/config/ssdsn.tbr'
alias vijcnt='vi $TB_HOME/src/tbsvr/include/j_cnt_in.list'
alias viiparam='vi $TB_HOME/src/iparam/iparam_table_svr.catalog.in'
alias viimap='vi $TB_HOME/config/ilog.map'
alias vislog='vi $TB_HOME/instance/$TB_SID/log/slog/sys.log'
alias vidpv='vi $TB_HOME/src/tbsvr/body/dpv.sql.in'

alias tbsqls='tbsql2 sys/tibero'
alias tbsqlt='tbsql2 tibero/tmax'
alias tba='tbdown abnormal'
alias tbc='tbdown clean'

alias lnpre='ln -s $TB_BRANCHES/prebuilt prebuilt'
alias buildset='cd $TB_HOME/tools; lnpre; cd $TB_HOME/src/autoconf; ./configure; cd $TB_HOME/src; cp Jamrules.local.eg Jamrules.local; echo "DEFS_ADD += -D_DONT_CHECK_LICENSE ;" >> Jamrules.local;'
alias rebuild='cd $TB_HOME/src; jam clean; jam realclean; jam autoconf; jam tool; jam -j9; jam -j9;'
alias rebuildall='cd $TB_HOME/src; jam clean; jam realclean; jam tool-clean; jam autoconf; jam tool; jam -j9; jam -j9;'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias xgrep="find . -name '*.[ch]' -o -name '*.template' -o -name '*.template_4_dbg' -o -name '*.(cpp|hpp)' | grep -v '\.build' | xargs egrep -n "
alias xgrepj="find . -name '*.java' -o -name '*.template' -o -name '*.template_4_dbg' | grep -v '\.build' | xargs egrep -n "
