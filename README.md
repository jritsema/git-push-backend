# git-push-backend

Sets up a git bare repo that can be used to run custom scripts when pushed to. Useful for doing simple CI/CD.

### usage

run the following on your server
```sh
./git-push-backend /Users/foo/my-app
```
```
Initialized empty Git repository in /Users/foo/my-app.git/

add an executable `build.sh` script to your repo

to execute, run the following:

git remote add build /Users/foo/my-app.git
git push build main
```

