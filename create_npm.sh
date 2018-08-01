#!/bin/bash

# $projectName - переданное значение ( имя пакета )

echo -e "\e[1;32m Введи имя для нового npm-пакета... \e[0m ." 
echo -e "\e[32m--------------------------------------- \e[0m"
echo " " 
# gulp-rollup-project - репозиторий с инструментами для разработки пакетов.
read projectName && git clone https://github.com/olegtempl/gulp-rollup-project $projectName;
cd $projectName && yarn install ;
# удаление связей с репозиторием gulp-rollup-project и подключение репозитория с именем проекта 
# ( создать на сайте гита репозитории для проекта)
rm -rf .git/ && git init && git remote add origin https://github.com/olegtempl/$projectName ;
echo " вероятно ошибка"
# start basic init project
# создание веток ( файлы сохраняться в dev ветке)
git checkout -b contributing && git checkout -b dev ;
# add files
git add package.json ; git commit -m 'update package';      		  # add package.json file
git add package-lock.json ; git commit -m 'update package-lock';      # add package-lock.json file
git add yarn.lock ; git commit -m 'update yarn.lock'		    # add yarn.lock file
git add .gitignore ; git commit -m 'update .gitignore';         # add .gitignore file
git add .npmignore ; git commit -m 'update .npmignore';         # add .gitignore file
git add gulpfile.js ; git commit -m 'update gulpfile'; 	    	# add gulpfile
git add .eslintrc.json ; git commit -m 'update .eslintrc';      # add .eslintrc.json file
git add .jsbeautifyrc; git commit -m 'update .jsbeautifyrc';    # add .jsbeautifyrc.js file
git add .editorconfig ; git commit -m 'update .editorconfig';   # add .eslintrc.json file
git add README.md ; git commit -m 'update README';    			# add readme file 
git add README\[RU\].md ; git commit -m 'update README[RU]';    # add readme file ru 
git add README\[BY\].md ; git commit -m 'update README[BY]';    # add readme file bel
git add README\[EN\].md ; git commit -m 'update README[EN]';    # add readme file en
git add index.js ; git commit -m 'add export file';				# add index.js
cd docs/jsDoc/ ; rm -rf *; cd ../..;							# clean directory docs/jsDoc/	
# add directries
git add src/; git commit -m 'update src';   				# add src dir
git add configs/; git commit -m 'update config';   		    # add config dir
git add docs/ ; git commit -m 'add docs';  				  	# add docs dir
git add test/ ; git commit -m 'update tests'  				# add test dir
cd src/ ; rm -rf *; touch index.js;						   	# clean directory src/js/
echo "
const cl = require('node-cl-log');
/*
	
*/
" >> index.js ; 											# update file src/js/index.js
# end basic init project
git add index.js ; git commit -m 'update main fail';
git checkout master && git merge --no-ff dev ;
git tag -a v0.0.0 -m 'initialization of the project'
git push origin master;
git checkout dev && git merge --no-ff master ;
git push origin dev;

# добавить публикацию в ветку master