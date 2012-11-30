#!/bin/sh
###APPNAME:     make_sys_ln
###APPAUTHOR:   geek
###APPDATE:     2007-10-04
###APPVER:      0.1
###APPDESC:     make symbol into /usr/share/applications
###APPUSAGE:    (name)
###APPEXAMPLE:  make_sys_ln mplayer-nogui.desktop
###APPOPTION:
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi

SYS_D=/usr/share/applications

APPNAME=$1
[ -f "$APPNAME" ] || APPNAME="$1.desktop"
if [ ! -f "$APPNAME" ] ; then
    echo "$1 not found." >&2
    exit 1
fi

APP=`fullname "$APPNAME"`

ln $2 $3 $4 $5 $6 $7 $8 $9 -vs "$APP" "$SYS_D/$APPNAME"





