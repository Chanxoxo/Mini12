read Source
read Destination
read Time
LOG_FILE=`touch ./creation.log`
while true
do
  for f in `find $Source -type f`
  do
    fileName=$Destination"/"`basename $f`
    if [ -f $fileName ]
      then
      modifiedDate=`stat -c %y $f`
      modifiedDataDest=`stat -c %y $fileName`
      if [[ $modifiedDate > $modifiedDataDest ]] 
        then 
        `cp -a $f $Destination`
        echo "$f Backup done on `date`" >>LOG_FILE
      fi
    else
      `cp -a $f $Destination`
      echo "$f Backup done on `date`" >>LOG_FILE 
    fi
  done
  sleep $Time
done
