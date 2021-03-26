alias batteryINFO="acpi -bi 2>/dev/null;upower -i $(upower -e | grep BAT) 2>/dev/null;LC_ALL=C \inxi -z -Bxxx 2>/dev/null"
alias cp='\cp --preserve=timestamps -uv'
alias mv='\mv -vi'
alias rm='\rm -i'
alias cp2NTFS='rsync -puv'
alias reset="\printf '\33c\e[3J'"
RSYNC_SKIP_COMPRESS_LIST="7z/aac/avi/bz2/deb/flv/gz/iso/jpeg/jpg/mkv/mov/m4a/mp2/mp3/mp4/mpeg/mpg/oga/ogg/ogm/ogv/webm/rpm/tbz/tgz/z/zip"
RSYNC_EXCLUSION="--exclude .git/ --exclude watch_later/ --exclude *.swp"
alias rsync='time \rsync -uth -P -z --skip-compress=$RSYNC_SKIP_COMPRESS_LIST $RSYNC_EXCLUSION'
alias lpq='\lpq -a +2'
alias df='LANG=C \df -PTh'
alias du='LANG=C \du -h'
alias ls='ls --color -F'
alias lla='ll -a'
alias lld='ll -d'
alias llah='ll -ah'
alias llh='ll -h'
alias ytdl='LANG=C.UTF-8 command youtube-dl'
