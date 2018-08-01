#!/bin/bash

# $projectName - переданное значение ( имя пакета )

echo -e "\e[1;32m Введи имя для нового проекта... \e[0m ." 
echo -e "\e[32m--------------------------------------- \e[0m"
echo " " 
# Easy-light-project - репозиторий с инструментами для разработки проектов.
read projectName && git clone https://github.com/olegtempl/Easy-light-project $projectName;
cd $projectName && yarn install ;
# удаление связей с репозиторием Easy-light-project и подключение репозитория с именем проекта 
# ( создать на сайте гита репозитории для проекта)
rm -rf .git/ && git init && git remote add origin https://github.com/olegtempl/$projectName ;
echo " вероятно ошибка"
# start basic init project
# создание веток ( файлы сохраняться в dev ветке)
git checkout -b contributing && git checkout -b dev ;
# add files
git add package.json ; git commit -m 'add package';      		 # add package.json file
git add package-lock.json ; git commit -m 'add package-lock';# add package-lock.json file
git add yarn.lock ; git commit -m 'add yarn.lock'		         # add yarn.lock file
git add yarn.lock ; git commit -m 'add yarn-error.log'       # add yarn.lock-error file
git add .gitignore ; git commit -m 'add .gitignore';         # add .gitignore file
git add .npmignore ; git commit -m 'add .npmignore';         # add .gitignore file
git add gulpfile.js ; git commit -m 'add gulpfile'; 	    	 # add gulpfile
git add .eslintrc.json ; git commit -m 'add .eslintrc';      # add .eslintrc.json file
git add .jsbeautifyrc; git commit -m 'add .jsbeautifyrc';    # add .jsbeautifyrc.js file
git add .editorconfig ; git commit -m 'add .editorconfig';   # add .eslintrc.json file
git add README\[RU\].md README\[BY\].md README\[EN\].md README.md; git commit -m 'add README files';    # add readme file ru 
git add how_to_start.md install_geckodriver.sh ; git commit -m 'install docs';
# add directries
git rm -r src/; git commit -m 'rm basic src/';   				# add src dir
git add configs/; git commit -m 'add config/';   		# add config dir
git add docs/ ; git commit -m 'add docs/';  		  	# add docs dir
git add test/ ; git commit -m 'add tests/';  			# add test dir
git add public/ ; git commit -m 'add public/';  		# add prodaction dir
# end basic init project
git push origin dev;
git tag -a v0.0.0 -m 'initialization of the project'
git branch macter;
git checkout master && git merge --no-ff dev ;
git push origin master;
# git merge --no-ff master ;

# добавить публикацию в ветку master