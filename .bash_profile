#BarRotem/13.07.2024 :
#This file did not originally exist on this Ubuntu VM. 
#It was created by me as a part of INTBashProject, during my INT_DevOps Studies.
#Much of the file's contents were copied from .profile in order to backup those important files.

# ~/.bash_profile: executed by the command interpreter for login shells.
# This file is the first AND ONLY  login shell file read by bash, if it exists.
# If this file doesn't exist in the user's home directory, one of .bash_login and .profile will >

# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#Beginning INTBashProject assigments :
#Greet the user
echo "Hello ${USER} !"
echo

#Define an env var
export COURSE_ID=DevOpsTheHardWay

#Interact with ~/.token file
if [[ -f "${HOME}/.token" ]]; then
	if [[ $(stat -c %a "${HOME}/.token") -ne "600" ]]; then
		echo "Warning: .token file has too open permissions"
	fi
fi

#Change user's umask. 666 > 660
umask 006
echo "Umask set : $(umask)."

#Add usercommands to PATH
export PATH="${PATH}:/home/${USER}/usercommands"
echo "Modified path : ${PATH}."

#Print date to screen
date_utc_iso=$(date --utc --iso-8601=seconds)
echo
echo "Current date (UTC/ISO) : ${date_utc_iso}."
echo

#Define command alias
alias ltxt="ll *.txt"
echo "Set user aliases."

#Cleanup ~/tmp dir
if [[ -d ~/tmp ]]; then
	rm ~/tmp/* 2> /dev/null
else
	mkdir ~/tmp
fi
echo "Modified ~/tmp directory."

#Kill proxy http bound processes
fuser -k 8080/tcp
echo "Killed port 8080 bound processes."

#Notify .bash_profile finished
echo "Everything set up successfully. enjoy, ${USER}" 

#The below section was copied from .profile file, in order to preserve it.
#--------------------------

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

