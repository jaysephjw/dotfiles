# Ensure we're using at least version 2.05. Weird arithmetic syntax needed here
# due to leading zeroes and trailing letters in some 2.x version numbers (e.g.
# 2.05a).
if ! [ -n "$BASH_VERSINFO" ] ; then
    return
elif ((BASH_VERSINFO[0] == 2)) && \
     ((10#${BASH_VERSINFO[1]%%[![:digit:]]*} < 5)) ; then
    return
fi

# Source global definitions
if [ -f "/etc/bashrc" ]; then
  source "/etc/bashrc"
fi

# Don't do anything if not running interactively
if [[ $- != *i* ]] ; then
    return
fi

# Don't do anything if running a restricted shell
if shopt -q restricted_shell ; then
    return
fi

# Turn off flow control and control character echo
stty -ixon -ctlecho 2>/dev/null

# Don't let anyone write(1) to my terminal
mesg n

# Use vi mode
set -o vi

# Don't allow the creation of aliases, functions are better
# http://www.gnu.org/software/bash/manual/html_node/Aliases.html#Aliases
# 'For almost every purpose, shell functions are preferred over aliases.'
enable -n alias unalias
shopt -u expand_aliases

# Autocorrect fudged paths in cd calls
shopt -s cdspell

# Update the hash table properly
shopt -s checkhash

# Update columns and rows if window size changes
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Include dotfiles in pattern matching
shopt -s dotglob

# Enable advanced pattern matching
shopt -s extglob

# Better History - See http://blog.sanctum.geek.nz/better-bash-history/

## Put multi-line commands onto one line of history
shopt -s cmdhist

## Append rather than overwrite Bash history
shopt -s histappend

## Repeat the line on failed history expansion
shopt -s histreedit

## Ignore common commands
HISTIGNORE='bg:fg:history'

## Ignore duplicated commands
HISTCONTROL=ignoredups

# Repeat the expanded line on successful history expansion
shopt -s histverify

# Don't use Bash's builtin host completion
shopt -u hostcomplete

# Don't warn me about new mail all the time
shopt -u mailwarn

# Ignore me if I try to complete an empty line
shopt -s no_empty_cmd_completion

# Use programmable completion, if available
shopt -s progcomp

# Warn me if I try to shift when there's nothing there
shopt -s shift_verbose

# Don't use PATH to find files to source
shopt -u sourcepath

# These options only exist since Bash 4.0-alpha
if ((BASH_VERSINFO[0] == 4)) ; then

    # Autocorrect fudged paths during completion
    shopt -s dirspell

    # Enable double-starring paths
    shopt -s globstar

    # Warn me about stopped jobs when exiting; only if >=4.1 due to bug
    # <https://lists.gnu.org/archive/html/bug-bash/2009-02/msg00176.html>
    if ((BASH_VERSINFO[1] >= 1)) ; then
        shopt -s checkjobs
    fi

    # Expand variables in directory completion; only available since 4.3
    if ((BASH_VERSINFO[1] >= 3)) ; then
        shopt -s direxpand
    fi
fi

# Load any supplementary scripts
if [[ -d $HOME/.bashrc.d ]] ; then
    for bashrc in "$HOME"/.bashrc.d/*.bash ; do
        if [[ -e $bashrc ]] ; then
            source "$bashrc"
        fi
    done
    unset -v bashrc
fi


# Load Local configuration
# This can be used for other settings you don’t want to commit.
[[ -f "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"
