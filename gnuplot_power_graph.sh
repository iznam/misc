#!/bin/bash

if [ -z "$1" ]; then
    echo "Please intput filename at first parameter"
    exit 1
fi 
  
if [ -z "$2" ]; then
    echo "Please intput Turbo Mode ["on" or "off"] at second parameter"
    exit 1
fi

if [ -z "$3" ]; then
    echo "Please intput Hyper-Transport Mode ["on" or "off"] at third parameter"
    exit 1
fi

if [ -z "$4" ]; then 
    echo "Please intput Test name at fourth parameter"
    exit 1
fi

cat <<EOF > plot_file.graph
#!/usr/bin/gnuplot -persist
set terminal postscript eps enhanced
set output "${1%.txt}.png"
set terminal png size 1024,700
set title "Power consumption | TB(TC)-$2; HT-$3; Test-$4 | AMD 6274; AMD 6278; Intel 2660" font "Helvetica,15"
set yrange [0:450]
#set y2tics 10 font "Helvetica,20"
set key box bottom right
set ytics 25 font "Helvetica,15"
set xtics 20 font "Helvetica,15"
#set y2range [0:100]
#set ytics nomirror
set key font "Helvetica,12"
#set a light green(#ccffcc) background color
#set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#ccffcc" behind
#set xdata time
#set timefmt "%S"
set grid xtics ytics y2tics mxtics mytics
#set grid ytics lt 1 lw 1 lc rgb "#ff0043"
#set grid y2tics lt 0 lw 1 lc rgb "#09ff00"
set ylabel "Power consumption, Watt" font "Helvetica,18"
set xlabel "Time, seconds" font "Helvetica,18"
#set y2label " C" font "Helvetica,18"
set style line 1 lt 1 pt 7
plot "$PWD/$1" using 1:2 title "AMD 6274" with linespoints linestyle 7 lt rgb "red",\
     "$PWD/$1" using 1:3 title "AMD 6278" with linespoints linestyle 7 lt rgb "blue",\
     "$PWD/$1" using 1:4 title "Intel 2660" with linespoints linestyle 7 lt rgb "green" 
EOF

cat plot_file.graph | gnuplot
rm plot_file.graph
