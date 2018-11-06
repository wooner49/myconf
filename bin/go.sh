
init_env()
{
	ulimit -c unlimited
	export LANG="ko_KR.EUC-KR"
	export LC_ALL="ko_KR.EUC-KR"

	export TB_DIR=$HOME/tibero
	export TB_BRANCHES=$TB_DIR/branches
	export REL5=$TB_BRANCHES/5_rel
	export REL6=$TB_BRANCHES/6_rel
	export EDITOR=vim
	export JAVA_HOME=$HOME/java/jdk1.6
	export PATH=$JAVA_HOME/bin:$PATH

	alias cdt='cd $TB_DIR'
	alias cdtb='cd $TB_BRANCHES'
	alias 5b='cd $REL5'
	alias 5p='cd $REL5/patch'
	alias 6b='cd $REL6'
	alias 6p='cd $REL6/patch'
    alias tb='go --path `pwd`; source ./tbenv `pwd` tibero'
    alias vck='echo "TB_HOME :  $TB_HOME"; echo "TB_SID  :   $TB_SID";'
    
    alias 5m='cd $TB_BRANCHES/5; tb;'
    alias 6m='cd $TB_BRANCHES/6; tb;'
    alias 7m='cd $TB_BRANCHES/7;'
    alias 7f='cd $TB_BRANCHES/coreframe'

    alias issue='cd $TB_DIR/issue;'
    alias gt='ps -ef | grep tbsvr;'
    alias up='5p; svn up; 6p; svn up;'

	alias svnst="svn status | grep -e '[AMD] '"

	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
	alias xgrep="find . -name '*.[ch]' -o -name '*.template' -o -name '*.template_4_dbg' -o -name '*.(cpp|hpp)' | grep -v '\.build' | xargs egrep -n "
	alias xgrepj="find . -name '*.java' -o -name '*.template' -o -name '*.template_4_dbg' | grep -v '\.build' | xargs egrep -n "

	if [ -f $HOME/my_dotfiles/aliases.sh ]; then
		source $HOME/my_dotfiles/aliases.sh
	fi
}

tibero_env_for_6()
{
	export LANG="ko_KR.EUC-KR"
	export LC_ALL="ko_KR.EUC-KR"

	alias cdh='cd $TB_HOME'
	alias cdi='cd $TB_HOME/instance/$TB_SID'
	alias cdlog='cd $TB_HOME/instance/$TB_SID/log'
	alias clst='cd $TB_HOME; svn revert -R *; ~/my_dotfiles/clst.sh;'

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

	alias lnpre="ln -s $TB_BRANCHES/prebuilt prebuilt"
	alias buildset='cd $TB_HOME/tools; lnpre; cd $TB_HOME/src/autoconf; ./configure; cd $TB_HOME/src; cp Jamrules.local.eg Jamrules.local; echo "DEFS_ADD += -D_DONT_CHECK_LICENSE ;" >> Jamrules.local;'
	alias rebuild='cd $TB_HOME/src; jam clean; jam realclean; jam autoconf; jam tool; jam -j9; jam -j9;'
	alias rebuildall='cd $TB_HOME/src; jam clean; jam realclean; jam tool-clean; jam autoconf; jam tool; jam -j9; jam -j9;'
}

tibero_env_for_7()
{
	echo "7"
	export LANG="ko_KR.UTF-8"
	export LC_ALL="ko_KR.UTF-8"

}

if [ "$1" = "--init" ]; then
	CURDIR=`pwd`
	echo $CURDIR
    init_env
	BASEDIR=$(dirname "$0")
	echo $BASEDIR
elif [ "$1" = "--path" ]; then
    if [ -e "$2""/tbenv" ]; then
        FIRST="${2##*/}"
        RELEASE="${2%/*}"
        SECOND="${RELEASE##*/}"
        if [ "$FIRST" = "6" ] || [ "$FIRST" = "5" ] || [ "$SECOND" = "6_rel" ] || [ "$SECOND" = "5_rel" ]; then
            tibero_env_for_6
        elif [ "$FIRST" = "7" ] || [ "$SECOND" = "7_rel" ]; then
            tibero_env_for_7
        fi
    else
        echo "no"
    fi

else
    echo "hello"
fi


while [ 1 ]; do
	break;
	[ "$1" = "--init" ] && { init_env; break; }
	[ -z "$1" ] && { echo "usage$ source $0 <Tibero path name>"; break; }


	case $1 in
		"5")
			[ -z "$2" ] && { cd "$TB_BRANCHES/$1"; tibero_env_for_6; break;}
			cd "$REL5"
			[ ! -d "$REL5/$2" ] && { echo "path $dir was not found" >&2; break; }
			;;
		"6")
			[ -z "$2" ] && { cd "$TB_BRANCHES/$1"; tibero_env_for_6; break;}
			;;
		"7")
			[ -z "$2" ] && { cd "$TB_BRANCHES/$1"; tibero_env_for_7; break;}
			;;
		*)
			;;
	esac

	break;
done




