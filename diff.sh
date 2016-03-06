INITIAL_COMMIT=bc9bcff4c56599645728fa4da9895846eeb37301
git diff -w $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools > $1/diff.patch

mkdir -p "$1"

for n in `git diff -w --name-only $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools`; do
	cp $n $1/`echo $n | sed 's/\//_/g'`
done
