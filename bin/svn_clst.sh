#!/bin/sh
# clear ? marked files 
svn st | grep '^?' | awk '{print $2;}' | xargs rm -rf 
