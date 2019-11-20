# git-push-backend

Sets up a git repo that can be used to run custom scripts when pushed to. Useful for doing simple CI/CD.

### usage

#### server

setup backend
```
./git-push-backend my-app
Initialized empty Git repository in /Users/foo/my-app.git/

customize my-app.git/hooks/post-receive
git remote add build my-app.git
```
---

#### client

add the new backend as a remote to your source repo
```
git remote add build pi@192.168.1.1:/home/pi/my-app.git
```

push changes
```
git commit -am "change"
git push build master
```