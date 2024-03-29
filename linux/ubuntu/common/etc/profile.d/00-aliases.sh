RSYNC_EXCLUSION="--exclude .git/ --exclude watch_later/ --exclude *.swp"
RSYNC_SKIP_COMPRESS_LIST="7z/aac/avi/bz2/deb/flv/gz/iso/jpeg/jpg/mkv/mov/m4a/mp2/mp3/mp4/mpeg/mpg/oga/ogg/ogm/ogv/webm/rpm/tbz/tgz/z/zip"
alias batteryINFO="acpi -bi 2>/dev/null;upower -i $(upower -e | grep BAT) 2>/dev/null;LC_ALL=C \inxi -z -Bxxx 2>/dev/null"
alias cp='\cp --preserve=timestamps -uv'
alias cp2FAT32='rsync --modify-window=1'
alias cp2NTFS='rsync -ogpuv'
alias cp2NTFSPartition='rsync -ogpuv -x -r'
alias cp2SDCard='rsync --size-only'
alias cp2exFAT='rsync -ogpuv'
alias cp2exFATPartition='rsync -ogpuv -x -r'
alias cp2ext234='rsync -ogpuv -lSH'
alias cp2ext234Partition='rsync -ogpuv -lSH -x -r'
alias cp2ftpfs='\rsync -uth --progress --inplace --size-only'
alias df='LANG=C \df -PTh'
alias du='LANG=C \du -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lF'
alias lla='ll -a'
alias llah='ll -ah'
alias lld='ll -d'
alias llh='ll -h'
alias lpq='\lpq -a +2'
alias ls='ls --color=auto -F'
alias mv='\mv -vi'
alias psu='ps -u $USER -O user:12,ppid,pcpu,pmem,start'
alias reset="\printf '\33c\e[3J'"
alias rm='\rm -i'
alias rsync='time \rsync -uth -P -z --skip-compress=$RSYNC_SKIP_COMPRESS_LIST $RSYNC_EXCLUSION'
alias ytdl='LANG=C.UTF-8 command youtube-dl'
alias ytdlp='LANG=C.UTF-8 command yt-dlp'
