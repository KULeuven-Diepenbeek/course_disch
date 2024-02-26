#!/bin/bash

PDFTK=/usr/bin/pdftk
PDFCROP=/usr/bin/pdfcrop
PDFCROP_OPTIONS="--margins 10"
MV=/bin/mv

args=("$@") 
argc=${#args[@]}


# check for input file
if [ $argc -lt 2 ]
then
  echo "ERROR: usage : extractImages.sh IFNAME <OFNAME_0> <OFNAME_1> ..."
  exit 1
fi

IFNAME=$1

if [ ! -f $IFNAME ]
then
  echo "  ERROR: \"$IFNAME\" NOT found"
  exit 1
fi
echo "  \"$IFNAME\" found"

# get number of pages
NOP=`$PDFTK $IFNAME dump_data | grep NumberOfPages`
arr=($NOP)
NOP=${arr[1]}

echo "  \"$IFNAME\" has $NOP page(s)"

((argc -= 1))

# do sanity check
if [ $argc -ne $NOP ]
then
  echo "ERROR: number of given OFNAMEs doesn't match number of pages ("$argc" != "$NOP")"
  exit 1
fi

n=1
#shift $args

#for i in "$args"

for i in "${@:2}"
do
  echo "  extracting page $n => $i"
  $PDFTK $IFNAME cat `echo $n` output a.pdf
  $PDFCROP $PDFCROP_OPTIONS a.pdf 1>/dev/null 2>&1
  
  if echo "$i" | grep -q "pdf"; then
    $MV a-crop.pdf $i
  else
    $MV a-crop.pdf $i.pdf
  fi

  convert $i.pdf ../drawio_new_${i}.png
  
  (( n += 1 ))
done

# clean up
rm a.pdf

echo "done"

