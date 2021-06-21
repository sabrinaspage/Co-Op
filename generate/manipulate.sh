#! /bin/sh
find . ! -name 'manipulate.sh' -type f -exec rm -f {} +

echo '' > first_file.txt
echo '' > second_file.txt
echo '' > moo.bak
echo '' > meow.bak
echo '' > arf.bak
echo 'dsnjf
dsfbj
bdsjf' > apple.py
echo '
sdfjn
dshjfbs
bdhjsb
dhjsbfj
hdjsbhj' > coconut.py
echo 'hello
dhsuj
dnsjf
dsj
dbhsjf
bdhjs
ndjs
bdhjsj
bdjs
bdhsj
dbsj
dnjsk' > blueberry.py

for file in *.txt; do
    [ -f "$file" ] || continue
    echo "$file"
    mv "$file" "new_$file"
done

for file in *.bak; do
    [ -f "$file" ] || continue
    echo "$file"
    rm "$file"
done

for file in *.py; do
    count="$(wc -l < $file | bc)"
    [ -f "$file" ] || continue
    echo "$count"
    if [ "$count" -ge 10 ]
    then
        mv "$file" "long_$file"
    else
        mv "$file" "short_$file"
    fi
done
