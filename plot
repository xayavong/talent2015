
#set key font ",12"

#set xlabel "n^2"
set ylabel "E"
set xrange[0.99:1.01]
set yrange[-50:450]

set noxtics


set label"n^2=0 (4)" at 1.002,0
set label"n^2=1 (24)" at 1.002, 100
set label"n^2=2 (48)"	at 1.002, 200
set label"n^2=3 (32)"	at 1.002, 300
set label"n^2=4 (24)"	at 1.002, 400

set terminal postscript eps enhanced color size 7cm,5cm
set output 'spe.eps'

set key at 0.998,300

plot 38.25184 title"Fermi" w l lt 1 lc 2 lw 2,\
"spe.dat" u 1:3 notitle w p lt 1 lc 1 lw 4

reset
