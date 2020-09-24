#! /bin/sh

current_path=$(cd `dirname $0`; pwd)
cd $current_path
cd ..
echo "cd :" `pwd`

echo "1/4 Cleanning watchman ..."
watchman watch-del-all

echo "2/4 Re install node_modules ..."
rm -fr node_modules
yarn install
./node_modules_install.sh

echo "3/4 Cleanning tmp"
rm -fr $TMPDIR/metro-cache
rm -fr $TMPDIR/hsperfdata_admin

echo "4/4 Cleanning builds ..."
rm -rf ios/build
rm -rf ios/Pods
rm -rf android/build
rm -rf android/app/build

