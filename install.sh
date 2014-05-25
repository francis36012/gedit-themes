#!/bin/bash

SYSINSTALLDIR1=/usr/share/gtksourceview-3.0/styles
SYSINSTALLDIR2=/usr/share/gtksourceview-2.0/styles

USRINSTALLDIR1=${HOME}/.gnome3/gedit/styles
USRINSTALLDIR2=${HOME}/.gnome2/gedit/styles

if [ $EUID -ne 0 ] ; then
	echo -n "Installing styles for current user only, continue: y for [yes], n for [no]: "
	read response

	if [ $response == 'y' ] ; then

		if [ -d "$USRINSTALLDIR1" ] ; then
		
			printf "Installing styles for all users...\n\n"
		
			sudo cp -v ./*.xml ${USRINSTALLDIR1}/

			# Make sure we have the right permissions
			printf "\n"
			printf "Setting permission\n"
			chmod 644 ${USRINSTALLDIR1}/*.xml

			printf "Installation successful :)\n"

			exit 0
		elif [ -d "$USRINSTALLDIR2" ] ; then

			printf "Installing styles for all users...\n\n"
		
			sudo cp -v ./*.xml ${USRINSTALLDIR2}/

			# Make sure we have the right permissions
			printf "\n"
			printf "Setting permission...\n"
			chmod 644 ${USRINSTALLDIR2}/*.xml

			printf "Installation successful :)\n"

			exit 0
		else
			printf "Can't find suitable installation directory for user-only installation :(\n"
			exit 0
		fi

	elif [ $response == 'n' ] ; then
		printf "Script is exiting...\n"
		exit 0
	else
		printf "Incorrect input, scripting exiting...\n"
		exit 0
	fi

else
	if [ -d "$SYSINSTALLDIR1" ] ; then

		printf "Installing styles for all users...\n\n"
		
		sudo cp -v ./*.xml ${SYSINSTALLDIR1}/

		# Make sure we have the right permissions
		printf "\n"
		printf "Setting permissions\n"
		chmod 644 ${SYSINSTALLDIR1}/*.xml

		printf "Installation successful :)\n"

		exit 0
	elif [ -d "$SYSINSTALLDIR2" ] ; then
		
		printf "Installing styles for all users...\n\n"
		
		sudo cp -v ./*.xml ${SYSINSTALLDIR2}/
		
		# Make sure we have the right permissions
		printf "\n"
		printf "Setting permission\n"
		chmod 644 ${SYSINSTALLDIR2}/*.xml

		printf "Installation successful :)\n"

		exit 0
	else
		printf "Can't find suitable installation directory for system-wide installation :(\n"
		exit 0
	fi
fi