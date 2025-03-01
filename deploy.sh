echo "This is an outdated repository: deploy by hand if you really want to"
exit 1

hugo

cd public

git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi
git commit -m "$msg"

git push origin master

cd ..
