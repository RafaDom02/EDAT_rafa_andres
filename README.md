# edat2021-22
Public repository for EDAT 2021-22


Follows instruction to clone this repository and create a *private* one

Create a new repo (let’s call it private-repo) via the Github UI. Then:

git clone --bare https://github.com/exampleuser/public-repo.git
cd public-repo.git
git push --mirror https://github.com/yourname/private-repo.git
cd ..
rm -rf public-repo.git

Clone the private repo so you can work on it:

git clone https://github.com/yourname/private-repo.git
cd private-repo
make some changes
git commit
git push origin master
