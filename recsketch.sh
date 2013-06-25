#!/bin/bash


# I use this to help with getting down ideas when I'm writing music.
# ./recsketch.sh [ songname ]

# set variables
TIME=$(date +%Y-%m-%d_%T)
NAME=$TIME"$1"

# Make directory if necessary
mkdir -p $1

# Record Audio
clear
figlet RECORDING
figlet "$1"
echo " ----------------"
echo "| CTRL+C to stop |"
echo " ----------------"
rec $1/new.ogg

# Options After Recoring
echo "--------------------------"
echo "Keep & Rec New           k"
echo "--------------------------"
echo "Keep & Exit              x"
echo "--------------------------"
echo "Discard & Rec New        d"
echo "--------------------------"
echo "Discard & Exit       ENTER"
echo "--------------------------"
read C
if [ $C = k ] 2> /dev/null
  then
  sox $1/new.ogg $1/$NAME.ogg trim 0.2 highpass 90 compand 0.3,0.8 6:-50,-50,-30 -3 -90 0.3 gain -n -3 gain -n -1 2> /dev/null
  ./recsketch.sh $1
elif [ $C = x ] 2> /dev/null
  then
  sox $1/new.ogg $1/$NAME.ogg trim 0.2 highpass 90 compand 0.3,0.8 6:-50,-50,-30 -3 -90 0.3 gain -n -3 gain -n -1 2> /dev/null
elif [ $C = d ] 2> /dev/null
  then 
  rm $1/new.ogg
  ./recsketch.sh $1
fi
rm ./$1/new.ogg 2> /dev/null

