#!/bin/bash

# ctags
rm -rf tags;
ctags -R;
# cscope
rm -rf cscope.files cscope.out;
find . -name '*.c' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -print > cscope.files;
cscope -i cscope.files
