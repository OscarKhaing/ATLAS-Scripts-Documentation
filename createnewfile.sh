

## how to find failed scripts
## set +e
## run the command grep:
## 	grep -r "Can't open" ./
## it returns list of .md pages that couldn't find perl script
## because SOMEHOW PUTTING set -e BREAKS THIS SCRIPT


FILENAME=${1%.*}
SCRIPTNAME="${FILENAME}.pl"
PAGENAME="${FILENAME}.md"

cd ~/ATLAS-toolkit/scripts/
perl ${SCRIPTNAME} 2> temp.txt
echo "...temp.txt copy successful"
mv temp.txt ~/ATLAS-Scripts-Documentation
cd ~/ATLAS-Scripts-Documentation/
cp template-page.md ${PAGENAME}
echo "...template-page copy successful"

sed -i "11i pointer" $PAGENAME 
sed -i -e '/pointer/r temp.txt' $PAGENAME
sed -i -e '11d' $PAGENAME
echo "...usage inserted"
rm temp.txt
echo "...temp.txt deleted"



## to do:
## 1. write script at the end to append URL of new page to README.md
## 2. auto detect if it is "Can't open", then report failure
## 3. auto detect if it is "Can't detect packages", then report failure
## 4. auto parse (if there are) options into different lines
## 		current ideas
## 		1. write the .md file entirely line by line with sed
## 		2. copy template, find pattern, and replace with sed

