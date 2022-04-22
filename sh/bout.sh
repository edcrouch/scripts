#!/bin/bash

export WINEPREFIX=/run/media/edward/Games/Lutris/the-book-of-unwritten-tales

frequency=60*5
backupLocation="/run/media/edward/External/save-backup/bout"
saveLocation="$WINEPREFIX/drive_c/users/edward/Documents/Book of Unwritten Tales/savegames"

changeDir () {
    cd "$WINEPREFIX/drive_c/GOG Games/The Book of Unwritten Tales"
}

launchGame () {
    ./Spacebar\ Remap-1-1.exe & ./bout.exe
}

backupSave () {
    while true
    do
        sleep $frequency
        cp "${saveLocation}/_autosave.ksg" "${backupLocation}/$(date '+%s')_autosave.ksg"
    done
}

trap "exit" EXIT SIGINT SIGTERM
changeDir; launchGame & backupSave;