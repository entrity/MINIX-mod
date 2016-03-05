INITIAL_COMMIT=bc9bcff4c56599645728fa4da9895846eeb37301
git diff -w $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools

for n in `git diff -w --name-only $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools`; do
	cp $n ../prog2-bundle/`echo $n | sed 's/\//_/g'`
done
