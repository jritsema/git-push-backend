#!/bin/bash
set -e

# create working repo
mkdir $1

# create push target repo
mkdir $1.git
cd $1.git
git init --bare

# create post-receive hook
tee hooks/post-receive <<EOF
#!/bin/bash
set -e

echo "checking out code..."
export GIT_WORK_TREE=$HOME/$1
git checkout -f master
cd $GIT_WORK_TREE

echo "TODO: something interesting"
EOF
chmod 755 hooks/post-receive
