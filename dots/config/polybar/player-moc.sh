#!/bin/sh

if [ "$(mocp -Q %state)" != "STOP" ]; then
    SONG=$(mocp -Q %song)
    SONG_FILE=$(basename "$(mocp -Q %file)" .mp3 )
    if [ -n "$SONG" ]; then
        echo " $SONG"
    else
        echo " $SONG_FILE"

    fi
else
    echo " "
fi
