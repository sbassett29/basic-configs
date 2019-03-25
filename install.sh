#!/usr/bin/env bash
################################################################################
# Author: sbassett@wikimedia.org
# License: Apache 2 <https://opensource.org/licenses/Apache-2.0>
# Usage: chmod +x install.sh && ./install.sh
################################################################################

set -euo pipefail

echo "WARNING: this will overwrite any existing config files!"
echo -n "Continue [y] or [n]: "
read -n 1 cont
echo -e "\n"

if [ "$cont" == "y" ]; then
    config_files=("bashrc" "bash_profile" "vimrc")
    for filename in "${config_files[@]}"
    do  
        if [[ -f "$filename" ]]; then
            cp -f "$filename" ~/."$filename"
            if [[ $filename == "bash*" ]]; then
                . ~/."$filename"
            fi  
            echo -e "Copied file: $filename to ~/.$filename\n"
        else
            echo -e "File: $filename not found in repo...\n"
        fi  
    done
else
    echo -e "\n\nInstallation of config files aborted!\n"
fi
