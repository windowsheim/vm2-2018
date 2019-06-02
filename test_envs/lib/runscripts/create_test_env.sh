#!/bin/bash
# destroy and delete all old stuff
vagrant destroy -f
rm -R .vagrant
rm /home/vagrant/.ssh/known_hosts
rm hosts
rm ansible.cfg

# copy default Vagrantfile
cp /home/vagrant/vagrantenv/test_envs/lib/vagrantfiles/Vagrantfile.default Vagrantfile

# get some userstuff
read -p "Geef klantnaam: " _clientname
read -p "Geef soort omgeving: " _envsrt
read -p "Geef ip-range: [172.16] " _iprange
read -p "Geef volgnummer [0-255]: " _number
_thishostname=$_clientname-$_envsrt-$_number

# insert userstuff in Vagrantfile
sed -i "7i machines = [{:hostname => \"$_thishostname-web\", :ip => \"$_iprange.$_number.111\"},{:hostname => \"$_thishostname-db\", :ip => \"$_iprange.$_number.112\"}]" Vagrantfile

# start vagrant
vagrant up

# create ansible.cfg and hosts files
echo -e "[defaults]\ninventory = hosts\nhost_key_checking = False" > ansible.cfg
echo -e "[all:vars]\nansible_python_interpreter=/usr/bin/python3\n\n[web]\n$_iprange.$_number.111\n\n[db]\n$_iprange.$_number.112\n" > hosts

# add public ssh-keys of servers to own known hosts
ssh-keyscan $_iprange.$_number.111 $_iprange.$_number.112 > /home/vagrant/.ssh/known_hosts

# cp playbooks and additional files to here...


# modify index.php with db ip


# run playbooks
