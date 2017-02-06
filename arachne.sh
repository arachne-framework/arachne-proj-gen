#!/usr/bin/env bash

VERSION=0.1.0

usage(){
    cat <<EOF
Usage: <operation> <arguments>

Supported operations:

new <template>

    Create a new Arachne project based on the provided template, which should
    be the URL of a git repository.

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




case "$1" in

    new)
        echo "creating new" $2
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

