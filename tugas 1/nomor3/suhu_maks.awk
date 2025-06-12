BEGIN { max = -999 }
NR > 1 { if ($2 > max) max = $2 }
END { print "Suhu maksimum: " max }
