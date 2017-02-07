#!/usr/bin/env bash

VERSION=0.1.0

usage(){
    cat <<EOF
Usage: <operation> <arguments>

Supported operations:

new <name> <template>

    Create a new Arachne project with the given name, based on the provided template.
    The template should be the clonable URI of a git repository.

update

    Update this initialization script

version

    Print out the version of this initialization script

EOF
}

update(){
    cat <<EOF
Automatic update is not yet supported. Please download the latest version of the script and install it.

For example:

    curl https://raw.githubusercontent.com/arachne-framework/arachne-proj-gen/release/arachne.sh > ~/bin/arachne
    chmod +x ~/bin/arachne
EOF

}

rename() {
   local from=$1
   local to=$2

   local from_alt=${from//-/_}
   local to_alt=${to//-/_}

   echo "renaming from $from to $to"
   echo "renaming from $from_alt to $to_alt"

   for f in `find . | grep $from | sort -r `; do
       local dest=`echo $f | sed s/$from/$to/`
       mkdir -p `dirname $dest`
       mv $f $dest
   done

   for f in `find . | grep $from_alt | sort -r `; do
       local dest=`echo $f | sed s/$from_alt/$to_alt/`
       mkdir -p `dirname $dest`
       mv $f $dest
   done

   for f in `find . -type f | grep -v '\./\.git'`; do
       sed -i '' s/$from/$to/g $f
       sed -i '' s/$from_alt/$to_alt/g $f
   done

}

rename_project(){
    local from_ns=$1
    local from_name=$2
    local to_ns=$3
    local to_name=$4

    rename $to_ns $to_ns

    # todo properly escape this so it actually works, and build an example so we can test
    rename ${from_ns//\./\/} ${to_ns//\./\/}

    rename $from_name $to_name
}

new() {
    local fqn=$1
    local repo=$2
    local oldfqn="foo.bar-baz/biz-buz"

    local name_re="([^/]+)/(.+)"

    if [[ $fqn =~ $name_re ]]; then
        local to_ns="${BASH_REMATCH[1]}"
        local to_name="${BASH_REMATCH[2]}"
    else
        echo "The name that was provide ($fqn) was not a fully qualified name"
        exit 1
    fi

    git clone $repo $to_name
    rm -rf $to_name/.git

    local oldname=`cat $to_name/.project-name`

    if [[ $oldname =~ $name_re ]]; then
        local from_ns="${BASH_REMATCH[1]}"
        local from_name="${BASH_REMATCH[2]}"
    else
        echo "The specified repository is not a valid template repository."
        exit 1
    fi

    local working=`pwd`
    rename_project $from_ns $from_name $to_ns $to_name
    cd $working
}


case "$1" in

    new)
        new $2 $3
        ;;
    update)
        update
        ;;
    version)
        echo "Arachne script version: $VERSION"
        ;;
    *)
        usage
        exit 1

esac

