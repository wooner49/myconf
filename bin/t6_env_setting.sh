#!/bin/bash
## Scripts for Tibero initial setting.

#PERL_VERSION="perl-5.18.2"
#PERL_DOWN_DIR="$HOME/Documents"
#PERL_BIN_DIR="/usr/local/perl"

echo "==================================================="
echo "========= Tibero Initial Setting start!! =========="
echo "==================================================="

## Install Package
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get upgrade -y

## Add something more.
PACKAGE_LIST="vim subversion ssh build-essential ctags cscope ccache distcc 
nmap oprofile libncurses5-dev expect cgdb valgrind nmon libaio-dev curl git 
dconf-editor zsh language-pack-ko zlib1g-dev"

for i in $PACKAGE_LIST; do
	sudo apt-get install -y $i
done

## Locale gen
sudo locale-gen ko_KR.EUC-KR

## gcc, g++ Compiler downgrade for Tibero6
gcc_major=`gcc --version | grep gcc | awk '{print substr($4, 1, 1)}'`
gcc_minor=`gcc --version | grep gcc | awk '{print substr($4, 3, 1)}'`
if [ $gcc_major -ne 4 -o $gcc_minor -ne 4 ]; then
	echo "====================================================="
	echo "========== GCC, G++ should be downgraded! ==========="
	echo "====================================================="

## For Ubuntu 16.04
#    temp=`grep "deb http://kr.archive.ubuntu.com/ubuntu/ trusty main universe" /etc/apt/sources.list | wc -l`
#	if [ $temp -ne 1 ]; then
#		sudo echo "deb http://kr.archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list
#	fi
#
#	temp=`grep "deb http://kr.archive.ubuntu.com/ubuntu/ trusty-updates main universe" /etc/apt/sources.list | wc -l`
#	if [ $temp -ne 1 ]; then
#		sudo echo "deb http://kr.archive.ubuntu.com/ubuntu/ trusty-updates main universe" >> /etc/apt/sources.list
#	fi

	sudo apt-get update
	GCC_LIST="gcc-4.4 g++-4.4 g++-4.4-multilib gcc-4.4-multilib"
	for j in $GCC_LIST; do
		sudo apt-get install -y $j
	done

	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 100
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 100
	sudo update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-4.4 100

	gcc_major=`gcc --version | grep gcc | awk '{print substr($4, 1, 1)}'`
	gcc_minor=`gcc --version | grep gcc | awk '{print substr($4, 3, 1)}'`

	if [ $gcc_major -eq 4 -a $gcc_minor -eq 4 ]; then
		echo "====================================================="
		echo "========== GCC, G++ Downgrade succeed!!!! ==========="
		echo "====================================================="
	else
		echo "====================================================="
		echo "========== GCC, G++ Downgrade failed!!!!! ==========="
		echo "====================================================="
	fi
fi


## For Ubuntu 16.04
## Perl version downgrade to 5.18.2
perl=`perl --version | grep version | awk '{print substr($4, 1, length($4)-1)}'`
version=`perl --version | grep version | awk '{print substr($6, 1, length($6)-1)}'`

if [ $perl -ne 5 -o $version -gt 18 ]; then
	echo $perl
	echo $version
	echo "================================================="
	echo "========== Perl should be downgraded! ==========="
	echo "================================================="

	#    wget "https://www.cpan.org/src/5.0/""$PERL_VERSION"".tar.gz" -P $PERL_DOWN_DIR
	#    cd $PERL_DOWN_DIR
	#    tar -zxvf "$PERL_VERSION"".tar.gz"
	#    cd $PERL_VERSION
	#    sudo ./Configure -des -Dprefix=$PERL_BIN_DIR
	#    sudo make
	#    sudo make test
	#    sudo make install
	#
	#    sudo mv "/usr/bin/perl" "/usr/bin/perl_temp"
	#    sudo ln -s "$PERL_BIN_DIR""/bin/perl" "/usr/bin/perl"

	cd $HOME
	\curl -L "https://install.perlbrew.pl" | bash
	echo 'source $HOME/perl5/perlbrew/etc/bashrc'
	. .bashrc
	perlbrew install "perl-5.18.2"
	perlbrew switch "perl-5.18.2"

	perl=`perl --version | grep version | awk '{print substr($4, 1, length($4)-1)}'`
	version=`perl --version | grep version | awk '{print substr($6, 1, length($6)-1)}'`
	subversion=`perl --version | grep version | awk '{print $8}'`

	if [ $perl -eq 5 -a $version -eq 18 -a $subversion -eq 2 ]; then
		echo "================================================="
		echo "========== Perl downgrade succeed!!!! ==========="
		echo "================================================="
	else
		echo "================================================="
		echo "========== Perl downgrade failed!!!! ============"
		echo "================================================="
	fi
fi

## TODO:
## /etc/hosts


echo "===================================================="
echo "========= Tibero Initial Setting finish!! =========="
echo "===================================================="
