for x in `ps | grep a.out | cut -c 2-7`; do
	echo $x
	kill $x
done