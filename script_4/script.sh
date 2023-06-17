#!/bin/bash
source ./.functions.sh
if [[ $EUID != 0 ]]
then
	zenity --error --text "Script has to be ran as root or sudo"
	exit
fi
while getopts "hv" opt;
do
	case $opt in
		h) zenity --info --width="300" --text="$(cat .help)" --title "HELP";;
		v) zenity --info --text="$(cat .version)" --title "VERSION";;
	esac
	exit
done
while [ 1 ];
do
	INPUT=$(zenity --list --height="500" --column "menu" --title "MENU" "Users" "Add user" "Delete user" "Groups" "Add group" "Delete group" "Group members" "Add member" "Delete member" "Change password")
	if [[ $? != 0 ]]
	then
		break
	else

		case "${INPUT}" in
			"Users")print_users;;
			"Add user")add_user;;
			"Delete user")del_user;;
			"Groups")print_groups;;
			"Add group")add_group;;
			"Delete group")del_group;;
			"Group members")print_members;;
			"Add member")add_member;;
			"Delete member")del_member;;
			"Change password")change_pass;;
		esac
	fi
done
