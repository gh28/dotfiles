#!/bin/bash

# .bashrc sourced by interactive & non-login bash

# set prompting; see PROMPTING in bash manual
function bash_ps1() {
    local readonly prefix="\[\e[32;40;1m\]----------------------------------------\[\e[m\]\n";
    local readonly workingDir="\[\e[33;1m\]\w\[\e[0m\]";
    local readonly currentTime="\[\e[37;1m\]\A\[\e[0m\]";
    local readonly prompt="\[\e[31;1m\]\$ \[\e[0m\]";
    case $TERM in
    linux)
        local readonly username="\[\e[35;40;1m\]\u\[\e[0m\]";
        local readonly hostname="\[\e[36;40;1m\]\H\[\e[0m\]";
        #echo "$prefix$username@$hostname:$workingDir\n$prompt";
        echo "$username@$hostname:$workingDir\n$prompt";
    ;;
    xterm*)
        local readonly titlebar="\[\e]2;\u@\h:\w\a\]";
        #echo "$prefix$titlebar$workingDir\n$prompt";
        echo "(\!) $titlebar$currentTime $workingDir\n$prompt";
    ;;
    esac
}
PS1=`bash_ps1`

# general aliases
alias ..='\cd ..'
alias grep='\grep --color=auto'
alias l='ls'
alias ls='\ls --classify --color=auto --group-directories-first --human-readable --show-control-chars'
alias ll='ls -a -h -l'
alias mv='mv -i'
alias df='df -hPT'
alias du='du -hs'
alias dstat='dstat -cdlmnpsy'
alias cmd='gnome-terminal'
alias chrome='google-chrome'

# jdk
#export JAVA_HOME=$HOME/app/jdk
#export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export PATH=$JAVA_HOME/bin:$PATH

# android sdk
export ANDROID_HOME=$HOME/app/android-sdk-linux
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
alias ale="adb logcat -d -s *:e"

alias vncs="x11vnc -dontdisconnect -noxfixes -shared -forever -rfbport 5900 -bg -rfbauth $HOME/.vnc/passwd"

# disable touchpad
synclient touchpadoff=1 2>/dev/null

# disable auto-mount-open
gsettings set "org.gnome.desktop.media-handling" "automount-open" "false"

# disable fn lock for thinkpad
# Linux 3.17 onwards supports it natively
# https://github.com/lentinj/tp-compact-keyboard
#tp-compact-keyboard --fn-lock-disable