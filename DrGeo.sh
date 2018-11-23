#!/bin/bash

# path

FILE="${BASH_SOURCE[0]}"
FILE="$(realpath $FILE)"
if [[ -L "$FILE" ]]; then
    FILE="$(readlink $FILE)"
fi
echo "$FILE"

APP=$(dirname "$FILE")
APP=$(realpath "${DIR}")    # resolve its full path if need be
echo "$APP"

VM="$APP/Contents/Linux"
RESOURCES="$APP/Contents/Resources"
image="$RESOURCES/drgeo.image"

NB_ARG=$#
# Help
drgeoHelp () {
    echo "$1"
    echo "Usage: DrGeo.sh [--sketch file] [--script file]"
}

makeAbsolute () {
    if [[ "${1:0:1}" == "/" ]] 
    then
	filename="$1"
    else
	filename=`pwd`"/$1"
    fi
}

# Do we have any Dr. Geo option to give to the image
# $1 option
# $2 arg. (filename)
drgeoOption () {
    makeAbsolute "$2"
    case "$1" in
	--sketch) 
	    if test -n "$2" 
	    then
		DRGEO_OPT="drgeo --sketch="
	    else
		drgeoHelp "Error: missing filename for sketch."
		exit
	    fi
	    ;;
	--script)
	    if test -n "$2" 
	    then
		DRGEO_OPT="drgeo --script="
	    else
		drgeoHelp "Error: missing filename for Smalltalk script."
		exit
	    fi
	    ;;
	*) 
	    if test "$NB_ARG" -eq 0
	    then
		DRGEO_OPT=
		filename=
	    elif test "$NB_ARG" -eq 1
	    then
		makeAbsolute "$1"
		DRGEO_OPT="drgeo --sketch="
	    else
		drgeoHelp "Unknow option $1."
		exit
	    fi
	    ;;
    esac
}


# icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
# systems and it seems to require an absolute filename)
gvfs-set-attribute \
	"$0" \
	"metadata::custom-icon" \
	"file://$RESOURCES/drgeo.png" \
	2> /dev/null


drgeoOption "$1" "$2"
echo $DRGEO_OPT"$filename"

# execute
exec "$VM/pharo" \
    --plugins "$VM" \
    --encoding utf-8 \
    -vm-display-X11 \
    --title "GNU Dr. Geo" \
    "$image" \
    $DRGEO_OPT"$filename"


    
