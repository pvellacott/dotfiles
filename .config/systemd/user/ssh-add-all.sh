#!/bin/bash
# Add all private keys in ~/.ssh
for key in ~/.ssh/id_* ~/.ssh/*; do
    if [[ -f "$key" && "$key" != *.pub ]]; then
        ssh-add -l &>/dev/null || ssh-add "$key" 2>/dev/null
    fi
done
