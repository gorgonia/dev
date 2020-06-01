#!/bin/bash


# This is for if you want to work on ALL the gorgonia repositories.
while getopts a:l: option
do
      case "${option}" in
	  a) ISALL=true;;
	  l) LOCALDIR=${OPTARG};;
      esac
done

if [ "$ISALL" = true ]; then
    echo "$LOCALDIR" from A
fi

echo $LOCALDIR

declare -a Packages=("gorgonia.org/gorgonia" "gorgonia.org/tensor" "gorgonia.org/cu" "gorgonia.org/golgi" "gorgonia.org/vecf32" "gorgonia.org/vecf64" "gorgonia.org/dawson" "gorgonia.org/randomkit" )

if [ -f "go.mod" ]; then
    for val in ${Packages[@]}; do
	DIR=$LOCALDIR/$val
	if [ -d "$DIR" ]; then
	    #echo "1 go mod edit -replace $val=$LOCALDIR/$val"
	    go mod edit -replace $val=$LOCALDIR/$val
	fi
    done
elif [ "$ISALL" = true ]; then
    for val in ${Packages[@]}; do
	DIR=$LOCALDIR/$val
	if [ -d "$DIR" ]; then
	    cd $DIR
	    # wheee quadratic!
	    for val2 in ${Packages[@]}; do
		DIR2=$LOCALDIR/$val
		if [ $val2 = $val ]; then
		    continue
		fi
		if [ -d "$DIR2" ]; then
		    #echo "2 go mod edit -replace $val2=$LOCALDIR/$val2"
		    go mod edit -replace $val2=$LOCALDIR/$val2
		fi
	    done
	fi
    done
else
    echo "No go.mod file found"
fi
