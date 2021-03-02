#!/bin/bash
##########
#
# Gitpull script.
#
##########

# Change directory
dir="$1"
if [[ ! -d "$dir" ]]; then
    echo "Directory $dir DOES NOT exist."
    exit 9999 # die with error code 9999
fi
cd $dir

# Iterate over git repositories and perform git pull and merge
personal="master"
main="master"
for d in */; do
    echo "$d"
    if [[ -d $d ]]; then
        cd $d
        if [[ -e .git ]]; then
            git add .
            git stash -- *
            git checkout $main
            git pull
            git checkout $personal
            git merge $main
        fi
        cd ..
    fi
done

