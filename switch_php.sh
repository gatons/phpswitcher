#!/bin/bash
# Switching between PHP versions
# Author: gatons <inboksis@gmail.com>

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@";

echo "PHP version switcher for dummies!";
echo "*********************************
";

echo "Now active: ";
apache2ctl -M | grep "php*"

echo "
Please enter version (5.6 or 7.2) number!
";

select opt in "5.6" "7.2" "Quit";

do

    case "$opt" in
	5.6 )

	  a2enmod php5.6;
	  a2dismod php7.2;
	  service apache2 restart;
	  exit;;

	7.2 )

	  a2enmod php7.2;
	  a2dismod php5.6;
	  service apache2 restart;
	  exit;;

	Quit )
	  exit;;

	* )
	  echo "Invalid value!"
    esac

done
