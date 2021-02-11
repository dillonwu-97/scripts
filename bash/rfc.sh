##########
# Function: Replaces first occurence of a word in all files in the directory
# To run: ./replace_first_occurence.sh
# TODO: 
# 1) add flags that permit change of one file or entire directory
#########

######## 
# Scratchwork meow
########
# Basically from position 0 to the first occurence of "name", replace "name" with "title"
# Single file:
# Linux champs
#sed '0/name/s/name/title/' $1
# Mac chumps
#sed '1,/name/s/name/title/' $1 

#######
# Useful resources:
# https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash
#######

####### Main Script #######

first_occurence_flag=0
while test $# -gt 0; do
	case "$1" in 
		-h|--help) 
			echo "This command replaces one word in a file with another word"
                        echo "-r is value to replace"
                        echo "-w is value to replace with" 
                        echo "-d to replace occurence for all files in directory"
                        echo "-f to replace occurence in a single file" 
                        echo "-o to replace first occurence as opposed to all occurences"
			shift			
			;;
		# --replace and --with are required arguments
		-r|--replace )
			shift # shift by one
			r=$1 # first argument is now the input for -r
			shift # shift again to get rid of input for -r			
			;;
		-w|--with )	
			shift
			w=$1
			shift
			;;
		-d|--directory)
			shift
			type="directory"
			d=$1
			shift
			;;
		-f|--file)
			shift
			type="file"
			f=$1
			shift
			;;
		-o)
			shift
			first_occurence_flag=1
			;;
	esac
done

# echo $type
if [ "$type" = "file" ]
then
	if test $first_occurence_flag -eq 1
	then
		sed -i '' "1,/$r/s/$r/$w/" "$f"
	elif test $first_occurence_flag -eq 0
	then
		sed -i '' "s/$r/$w/g" "$f"
	fi
elif [ "$type" = "directory" ]
then
	# echo $d
	for i in $d/*
	do
		# echo $i
		if test $first_occurence_flag -eq 1
		then
			sed -i '' "1,/$r/s/$r/$w/" $i
		elif test $first_occurence_flag -eq 0
		then
			sed -i '' "s/$r/$w/g" $i
		fi
	done
fi
	



#for f in 
#do
#	echo $f
#	sed -i '' '1,/name/s/name/title/' $f
#done


