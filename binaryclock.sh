#!/bin/bash
#
# I have no idea if this is going to work
#
#
# I need date +%I, +%M, and +%S

get_digit () {
	STR=$1
	VAL=$2
	CHAR=${STR:VAL:1}
	echo $CHAR
}

to_binary () {
	echo "obase=2;$1" | bc
}

while true; do

	HOUR=$(date +%H)
	MIN=$(date +%M)
	SEC=$(date +%S)

	COL0=$(to_binary $(get_digit $HOUR 0))
	COL1=$(to_binary $(get_digit $HOUR 1))
	COL2=$(to_binary $(get_digit $MIN 0))
	COL3=$(to_binary $(get_digit $MIN 1))
	COL4=$(to_binary $(get_digit $SEC 0))
	COL5=$(to_binary $(get_digit $SEC 1))

	COLS="$COL0 $COL1 $COL2 $COL3 $COL4 $COL5"

	FMT_COLS=$(echo $COLS | awk '{ printf("%02d %04d %03d %04d %03d %04d\n", $1, $2, $3, $4, $5, $6) }')

	H=${FMT_COLS:0:7}
	M=${FMT_COLS:8:8}
	S=${FMT_COLS:17:8}

	x0y0=${H:1:1}
	x0y1=${H:0:1}

	x1y0=${H:6:1}
	x1y1=${H:5:1}
	x1y2=${H:4:1}
	x1y3=${H:3:1}

	x2y0=${M:2:1}
	x2y1=${M:1:1}
	x2y2=${M:0:1}

	x3y0=${M:7:1}
	x3y1=${M:6:1}
	x3y2=${M:5:1}
	x3y3=${M:4:1}

	x4y0=${S:2:1}
	x4y1=${S:1:1}
	x4y2=${S:0:1}

	x5y0=${S:7:1}
	x5y1=${S:6:1}
	x5y2=${S:5:1}
	x5y3=${S:4:1}

	clear

	echo "............."
	echo "...$x1y3...$x3y3...$x5y3."
	echo "...$x1y2.$x2y2.$x3y2.$x4y2.$x5y2."
	echo ".$x0y1.$x1y1.$x2y1.$x3y1.$x4y1.$x5y1."
	echo ".$x0y0.$x1y0.$x2y0.$x3y0.$x4y0.$x5y0."
	echo "............."

	sleep 1
done

# substr($STRING,INDEX,LENGTH)
