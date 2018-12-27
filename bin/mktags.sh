#!/bin/bash

# ctags
rm -rf tags;
ctags -R --exclude=*.asm --exclude=.git ./* ;
# cscope
rm -rf cscope.files 
rm -rf cscope.out
find . -name '*.c' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -print > cscope.files;
#cscope -i cscope.files
cscope -b


## TODO: tags에서 asm파일 못읽도록 수정 필요
