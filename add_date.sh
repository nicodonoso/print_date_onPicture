#!/bin/bash
# por Nico Donoso at CECs ndonoso@cecs.cl
# Script que lee todos los *.jpg de un directorio, selecciona los ano, mes, dia, hora, minuto y lo imprime en la misma foto, para después guardar con el nombre de anomesdiahoraminuto.jpg
#Es necesario instalar : imagemagick
#sudo apt install imagemagick

#for img in *jpg; do convert "$img" -gravity SouthEast -pointsize 22 \
#   -fill white -annotate +30+30  %[exif:DateTimeOriginal] "time_""$img"; 
#done

#ls *.jpg | cut -c 16-22

sep="/"
hsep=":"
space=" "
for f in *.jpg;
do
ano=$(echo ${f}|cut -c11-14);
mes=$(echo ${f}|cut -c15-16);
dia=$(echo ${f}|cut -c17-18);
hora=$(echo ${f}|cut -c19-20);
minuto=$(echo ${f}|cut -c21-22);
convert "$f" -font courier -fill red -pointsize 70 -gravity SouthEast -annotate +10+40 "$ano$sep$mes$sep$dia$space$hora$hsep$minuto" "$ano$mes$dia$hora$minuto".jpg
echo "procesando imagen"  "$f";
done

