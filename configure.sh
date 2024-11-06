SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
ATTGITS=$DIR"/"attgits.sh
PROGRESS_BAR=$DIR"/"progress_bar.sh
chmod a+x $ATTGITS
ln -s $ATTGITS /bin/attgits
ln -s $PROGRESS_BAR /bin/progress_bar.sh

