BEGIN { total = 0; count = 0 }
NR > 1 { total += $3; count++ }
END { print "Rata-rata kelembaban: " total / count }
