#!/bin/bash

# Author: Gaukas

# Enforce root/sudoer execution
_WHO=$(sudo whoami)

if [ ${_WHO} != "root" ]; then
        echo "Please run the script as root/under sudoer."
        exit
fi

_WHERE_IS_PIP3=()
IFS=' '
read -ra _WHERE_IS_PIP3 <<< $(whereis pip3)

if [ -z ${_WHERE_IS_PIP3[1]// } ]; then
        echo "pip3 not detected. Please install pip3 and make sure it could be called as 'pip3 -V'"
        exit
fi

echo "pip3 installation detected: ${_WHERE_IS_PIP3[1]}"

_WHERE_IS_PIP=()
IFS=' '
read -ra _WHERE_IS_PIP <<< $(whereis pip)

if [ -n "${_WHERE_IS_PIP[1]// }" ]; then
        echo "pip detected. Checking diff."
        sudo cmp --silent ${_WHERE_IS_PIP[1]} ${_WHERE_IS_PIP3[1]} && echo "pip is already the same as pip3. Now aborting." && exit
        LINK_TGT=$(sudo readlink -e ${_WHERE_IS_PIP[1]})
        sudo cmp --silent $LINK_TGT ${_WHERE_IS_PIP3[1]} && echo "pip is linked to pip3. Now aborting." && exit
        # So far not aborted, time to backup and get new link.
        pip_dir=$(sudo dirname ${_WHERE_IS_PIP[1]})
        echo "Renaming ${_WHERE_IS_PIP[1]} as ${pip_dir}/pip_old"
        sudo mv ${_WHERE_IS_PIP[1]} ${pip_dir}/pip_old
fi

# Creating symlink from pip to pip3, in the directory of pip3
pip3_dir=$(sudo dirname ${_WHERE_IS_PIP3[1]})
sudo ln ${_WHERE_IS_PIP3[1]} ${pip3_dir}/pip && sudo chmod +x ${pip3_dir}/pip || echo "Error in hard link creation."
echo "pip is now hard-linked to pip3. Enjoy!"
