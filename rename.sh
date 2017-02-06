#!/usr/bin/env bash

NAME=$1
ALT_NAME=${NAME//-/_}

PATTERN=module-template
ALT_PATTERN=${PATTERN//-/_}

#echo $PATTERN
#echo $ALT_PATTERN

for f in `find . | grep $PATTERN | sort -r `; do
    dest=`echo $f | sed s/$PATTERN/$NAME/`
    mkdir -p `dirname $dest`
    mv $f $dest
done

for f in `find . | grep $ALT_PATTERN | sort -r`; do
    dest=`echo $f | sed s/$ALT_PATTERN/$ALT_NAME/`
    mkdir -p `dirname $dest`
    mv $f $dest
done

for f in `find . -type f | grep -v '\./\.git'`; do
    sed -i '' s/$PATTERN/$NAME/g $f
    sed -i '' s/$ALT_PATTERN/$ALT_NAME/g $f
done
