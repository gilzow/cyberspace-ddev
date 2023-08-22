#!/usr/bin/env bash


# Place this file in your repo, and chmod +x
read -p "Platform or Upsun? [U/p]: " answer
read -p "What branch/tag/PR should I check out? [main]:" targetCheckout

# macos is on super old bash version
answer=$(echo "${answer}" | tr '[:upper:]' '[:lower:]')
if [ "p" == "${answer:0:1}" ]; then
  paas="platform"
elif [ "u" == "${answer:0:1}" ] || [ "" == "${answer}" ]; then
  paas="upsun"
fi

if [ -z ${targetCheckout+x} ] || [ "" == "${targetCheckout}" ]; then
  targetCheckout="main"
fi

# TARGET_TAG="v0.1.2"
#TARGET_PR="akalipetis/issue-125"
baseDir="utils"
DIRECTORY="${baseDir}/ify"

if [ -d "${baseDir}" ]; then
    echo "Pass"
else
    mkdir "${baseDir}"
fi

# Comment this section out if you don't want to redownload every time to the latest version.
if [ -d "$DIRECTORY" ]; then
    echo "$DIRECTORY does exist. Removing before clone."
    rm -rf $DIRECTORY
fi

git clone git@github.com:platformsh/platformify.git $DIRECTORY

cd $DIRECTORY
# git checkout tags/$TARGET_TAG
printf "Checking out %s...\n" "${targetCheckout}"
git checkout $targetCheckout
go build "./cmd/${paas}ify/"

# After running ./setup.sh, you'll have access to upsunify @ utils/ify/upsunify
# or platformify @ utils/ify/platformify

# For example, if I create a django project at (root)/my-awesome-project, I can run

# $ cd my-awesome-project
# $ ../utils/upsunify/upsunify

printf "You can now run ./utils/ify/%sify\n" "${paas}"