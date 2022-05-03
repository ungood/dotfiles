#/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
DIR=$DIR

FILES=`ls -A1 $DIR | egrep -iv "^\.git$" | egrep -i "^\."`
for file in $FILES
do
    echo $file
    ln -sf $DIR/$file $HOME/$file
done