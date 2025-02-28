#!/bin/bash

declare -A users

users["suha"]="managers, admins"
users["daniel"]="admins, sysadmins"
users["liam"]="admins"
users["noah"]="managers, artists"
users["alysha"]="artists"
users["rose"]="artists, devs"
users["sadia"]="devs"
users["jakub"]="devs"
users["lev"]="devs"
users["grace"]="rh"
users["lucia"]="rh"
users["oliver"]="rh"
users["nginx"]=""

if dnf repolist | grep -v epel ; then
    dnf config-manager --set-enabled crb
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
fi

if dnf list installed | grep -v pwgen; then
    dnf install -y pwgen
fi


for user in "${!users[@]}"; do
    useradd -m $user -s /bin/bash
    while true; do
    PASSWORD=$(< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()-_=+' | head -c 14)
    if [[ "$PASSWORD" =~ [A-Z] ]] && [[ "$PASSWORD" =~ [a-z] ]] && [[ "$PASSWORD" =~ [0-9] ]] && [[ "$PASSWORD" =~ [\!\@\#\$\%\^\&\*\(\)\_\+\=\-] ]]; then
        break
    fi
    done

    echo "$PASSWORD" | passwd $user --stdin
    echo "$user : $PASSWORD" >> /home/lucas/users.txt
    if [[ -n "${users[$user]}" ]]; then
        IFS=', ' read -ra groups <<< "${users[$user]}"
        
        for group in "${groups[@]}"; do
            if getent group $group; then
                usermod -a -G $group $user
            else
                groupadd $group
                usermod -a -G $group $user
            fi
        done
    fi
done


