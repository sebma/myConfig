RSYNC_EXCLUSION="--exclude .git/ --exclude watch_later/ --exclude *.swp"
RSYNC_SKIP_COMPRESS_LIST="7z/aac/avi/bz2/deb/flv/gz/iso/jpeg/jpg/mkv/mov/m4a/mp2/mp3/mp4/mpeg/mpg/oga/ogg/ogm/ogv/webm/rpm/tbz/tgz/z/zip"
alias batteryINFO="acpi -bi 2>/dev/null;upower -i $(upower -e | grep BAT) 2>/dev/null;LC_ALL=C \inxi -z -Bxxx 2>/dev/null"
alias cp2NTFS='rsync -puv'
alias cp='\cp --preserve=timestamps -uv'
alias df='LANG=C \df -PTh'
alias du='LANG=C \du -h'
alias lla='ll -a'
alias llah='ll -ah'
alias lld='ll -d'
alias llh='ll -h'
alias lpq='\lpq -a +2'
alias ls='ls --color -F'
alias mv='\mv -vi'
alias reset="\printf '\33c\e[3J'"
alias rm='\rm -i'
alias rsync='time \rsync -uth -P -z --skip-compress=$RSYNC_SKIP_COMPRESS_LIST $RSYNC_EXCLUSION'
alias ytdl='LANG=C.UTF-8 command youtube-dl'
