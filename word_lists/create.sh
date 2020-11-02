#!/usr/bin/env bash

rm -rf out
mkdir -p out

for wordtype in nouns adjectives; do

  for letter in {a..z}; do
    file="out/${wordtype}-${letter}.json"
    echo "[" > $file
    grep "^${letter}" "${wordtype}.txt" | sort | uniq | awk '{ print "\""$0"\","}' >> $file
    gsed -i '$s/,$//' $file
    echo "]" >> $file
  done

  megafile="out/${wordtype}.json"
  echo "{" > $megafile
  for letter in {a..z}; do
    file="out/${wordtype}-${letter}.json"
    echo "\"${letter}\": " >> $megafile
    cat $file >> $megafile
    echo "," >> $megafile
  done

  gsed -i '$s/,$//' $megafile
  echo "}" >> $megafile

  ./pp.sh $megafile

  cp $megafile ../app/data/

done
