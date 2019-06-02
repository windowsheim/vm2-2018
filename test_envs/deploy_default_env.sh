#!/bin/bash

function endsession() {
	echo "doei"
	exit 1;
}

# vaststellen klant, verplaatsen naar map klant
function setclient() {
echo "Hallo klant, wat is je naam?";
read _clientname;
echo "Hallo $_clientname";
if [ ! -d "$_clientname" ]; then
	echo "Gebruiker $_clientname onbekend, directory wordt gemaakt";
	mkdir $_clientname;
fi;
echo "verplaatsen naar map $_clientname";
cd $_clientname;
_clientenvs=$(ls -l | grep ^d | wc -l);
echo $_clientenvcount;
}
setclient

function delete_env() {
echo "Welke omgeving wilt u verwijderen?";
read _delete_env_no
cd $_delete_env_no
vagrant destroy -f
cd ..
rm -R $_delete_env_no
echo "Omgeving $_delete_env_no is verwijderd"
setenvchoice
}

function setenvchoice() {
echo "Wilt u een [s]tandaard- of een [t]estomgeving, [v]erwijderen of stoppen[q]?";
read _environmentchoice
case $_environmentchoice in
	"s")
		_logmessage="s is pressed";;
	"t")
	        _logmessage="t is pressed";;
	"q")
		endsession;;
	"v")
		delete_env;;
	*)
		echo "\"$_environmentchoice\" is geen goede optie";
		setenvchoice;;
esac
echo "$_logmessage";
}
setenvchoice
