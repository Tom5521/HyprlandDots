#
# ~/.bashrc
#

export CC=clang
export CXX=clang++
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='\w►'
