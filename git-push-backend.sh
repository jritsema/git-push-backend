#!/bin/bash
set -e

# create working repo
mkdir $1

# create push target repo
mkdir $1.git
cd $1.git
git init --bare

# create post-receive hook
tee hooks/post-receive <<EOF >/dev/null
#!/bin/bash
set -e

echo "checking out code..."
export GIT_WORK_TREE=$1
git checkout -f main
cd $1

# execute build script (if exists)
if test -f build.sh; then
	echo ""
	echo "executing build.sh..."
  ./build.sh
	echo ""
else
	echo ""
	echo "build.sh not found"
	echo ""
fi
EOF
chmod 755 hooks/post-receive

echo ""
echo "customize $1.git/hooks/post-receive"
echo "git remote add build $1.git"
