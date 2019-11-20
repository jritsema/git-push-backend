# git-push-backend

Sets up a git repo that can be used to run custom scripts when pushed to. Useful for doing simple CI/CD.

### usage

#### server

setup backend
```
./git-push-backend my-app
```

customize script to run on git push
```
vim my-app.git/hooks/post-receive
```
```bash
#!/bin/bash
set -e

echo "checking out code..."
export GIT_WORK_TREE=/home/pi/my-app
git checkout -f master
cd $GIT_WORK_TREE

echo "TODO: something interesting"
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