read -p "Enter name of git repo: " line 

DEBUG=0

if [[ -d $line ]]
then
	echo "Error: directory $line already exists"
	exit
fi

if [[ -f "tokens.txt" ]] 
then
	# Reading in token
	token=$(cat tokens.txt)
	link="https://${token}@github.com/dillonwu-97/${line}"
	echo $link

	mkdir $line
	cd $line
	git init
	git remote add origin $link
	git branch -m main
	git pull origin main
	

	if [[ DEBUG -eq 1 ]]
	then
		cd ..
		rm -r $line
	fi 
		
else 
	echo "tokens.txt file not found" 
fi
