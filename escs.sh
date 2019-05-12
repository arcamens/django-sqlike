##############################################################################
cd ~/projects/
git clone git@bitbucket.org:arcamens/sqlike.git sqlike-code
##############################################################################
# push sqlike master.
cd ~/projects/django-sqlike-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;

git status
git add *
git commit -a
git push -u origin master
##############################################################################
# push sqlike staging.
cd ~/projects/django-sqlike-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;

git status
git add *
git commit -a
git push -u origin staging
##############################################################################
# create dev branch.
cd ~/projects/sqlike-code
git branch -a
git checkout -b development
git push --set-upstream origin development
##############################################################################
# merge staging into master
git checkout master
git merge staging
git push -u origin master
git checkout staging
##############################################################################
# sqlike, pull.
cd ~/projects/sqlike-code
git pull
##############################################################################
# delete, last, commit.

cd ~/projects/sqlike-code
git reset HEAD^ --hard
git push -f
##############################################################################
# Create releases.
git tag -a v1.0.0 -m 'Initial release'
git push origin : v1.0.0

git tag -a v2.0.0 -m 'Running on django 2.'
git push origin : v2.0.0

##############################################################################
# Upload the package to pypi.
python setup.py sdist register upload
rm -fr dist


