cc ~/floppy/do-spinlock.c
echo starting...
./a.out &
sleep 1
echo starting...
./a.out &
sleep 1
echo starting...
./a.out &
sleep 1
echo starting...
./a.out &
sleep 1
echo starting...
./a.out &
echo doner

for x in `ps | grep a.out | cut -c 2-7`; do
	kill $x
	exit 0
done