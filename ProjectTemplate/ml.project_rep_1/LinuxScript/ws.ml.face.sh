#!/bin/bash

pathProject="$(cd ..; pwd)"/
pathTensorBoard="$pathProject"TensorBoard/
pathNotebook="$pathProject"Notebook/
pathLinuxScript="$pathProject"LinuxScript/
pathSource="$pathProject"Source/
pathJupyterImport="$pathLinuxScript"_notebooks.txt
pathLogJ="$pathLinuxScript"Logs/Jupyter.out
pathLogT="$pathLinuxScript"Logs/TensorBoard.out
pathLogP="$pathLinuxScript"Logs/Python.out
ipadress="$(hostname -i)"


Activate_Environment () {
	source ~/anaconda3/etc/profile.d/conda.sh
	conda activate ml
}

Launch_Notebook() {	
	if [ -d $pathLogJ ]; then
		rm -f $pathLogJ
	fi
	cd "$pathProject"

	sudo pkill -9 jupyter

	jupyter="jupyter notebook --ip=$ipadress --allow-root --no-browser"

	nohup $jupyter > $pathLogJ 2>&1 &

	timeout 2s tail -f  $pathLogJ
}


Launch_Tensorboard() {	
	if [ ! -d $pathTensorBoard ]
	then
		echo "Can't find $pathTensorBoard"
		targetPath=".."
	fi
	if [ -d $pathLogT ]; then
		rm -f $pathLogT
	fi
	tensorboard="tensorboard --logdir $pathTensorBoard --host $ipadress --port 9999"

	nohup $tensorboard > $pathLogT 2>&1 &
	timeout 2s tail -f  $pathLogT
}


Run_Notebook() {	
	cd "$pathNotebook"
	read -e -p "Which notebook you wanna run:" notebook
	# notebook="$(pwd)/""$notebook"
	notebook="$pathNotebook""$notebook"
	if [ -f $notebook ]; then
		sudo pkill -9 python
		echo "Executing $notebook ..."
		jupyter-nbconvert --to notebook  --stdout --inplace --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=-1 --execute $notebook
	else
		echo "Can't find "$notebook
	fi
}

Run_Python() {	
	cd "$pathProject"
    echo "You are at $pathProject"
    echo "Be aware that execute directory will be at $pathSource"
	read -e -p "Which python you wanna run:" python
	# notebook="$(pwd)/""$notebook"
	python="$pathProject""$python"
	if [ -f $python ]; then		
		# Error log path
		if [ -d $pathLogP ] 
		then
		    rm -f $pathLogP
		fi
		sudo pkill -9 python
		echo "Executing $python ..."
        cd "$pathSource"
		nohup python3 $python > $pathLogP 2>&1 & 
		tail -f  $pathLogP
	else
		echo "Can't find "$python
	fi
}


Run_Notebooks_From_File() {	
	read -e -p "Are you ready? (y/n)" n3
	cd "$pathNotebook"
	case $n3 in
		y) 			
			while IFS= read -r line
				do
					notebook="$pathNotebook""$line"
					if [ -f $notebook ]; then
						sudo pkill -9 python
						echo "Executing $notebook..." 
						jupyter-nbconvert --to notebook --inplace --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=-1 --execute $notebook 
					else
						echo "Can't find "$notebook
					fi
			done < "$pathJupyterImport"
			;;
		*) 
			;;
	esac
	
}
# ----------------------------------------------------------------------------------------------------------------------------------------  #

Launch_Processes() {
	while true; do
		clear && clear
		echo "-------------------------"
		echo "Select process to launch: "
		echo "-------------------------"
		echo " 1 ) [Background] Jupyter Notebook"
		echo " 2 ) [Background] TensorBoard"
		echo " 3 ) [Background] All"
		echo " 4 ) [Jupyter]    Run single notebook"
		echo " 5 ) [Jupyter]    Run multiple notebooks from import file"
		echo " 6 ) [Python]     Run python in the background"
		echo " * ) Back"

		read n1
		case $n1 in
			1) 			
				Launch_Notebook
				;;
			2) 
				Launch_Tensorboard
				;;
			3) 
				Launch_Notebook
				Launch_Tensorboard
				;;
			4) 
				Run_Notebook
				;;
			5) 
				Run_Notebooks_From_File
				;;
			6) 
				Run_Python
				;;
			*) 
				;;
		esac
		read -p "Press anykey to exit" a
		break
	done
}

Kill_Processes() {
	while true; do
		clear && clear
		echo "-----------------------"
		echo "Select process to kill:  "
		echo "-----------------------"
		echo " 1 ) Kill Jupyter Notebook"
		echo " 2 ) Kill TensorBoard"
		echo " 3 ) Kill Python"
		echo " 4 ) Kill All"
		echo " * ) Back"

		read n2
		case $n2 in
			1) 			
				sudo pkill -9 jupyter
				echo "Killed Jupyter Notebook"
				;;
			2) 
				sudo pkill -9 tensorboard
				echo "Killed TensorBoard"
				;;
			3) 
				sudo pkill -9 python
				echo "Killed Python"
				;;
			4) 
				sudo pkill -9 tensorboard
				sudo pkill -9 jupyter
				sudo pkill -9 python
				echo "Killed All"
				;;
			*) 
				;;
		esac
		read -p "Press anykey to exit" a
		break
	done
}

# ----------------------------------------------------------------------------------------------------------------------------------------  #


while true; do
	clear && clear
	Activate_Environment
	echo "---------------------"
	echo "Select the operation:"
	echo "---------------------"
	echo " 1 ) Launch"
	echo " 2 ) Open Folder"
	echo " 3 ) Kill"
	echo " * ) Exit"

	read n0
	case $n0 in
		1) 
			Launch_Processes
			;;
		2) 
			cd "$pathProject"
			nautilus "$pathProject" 
			exit
			;;
		3) 
			Kill_Processes
			;;
		*) 
			exit
			;;
	esac

	cd "$pathLinuxScript"	
done



gnome-terminal -e command