#!/usr/bin/env bash

echo "The Post Clone Script"

if [ -z "$Username" ]
then 
    echo "This script requires the build varible in App Center Username to be set"
    exit
fi

if [ -z "$Password" ]
then
    echo "This script requires the build variable in App Center Password to be set"
    exit
fi

echo "Configure Username and Password for Secured Swift Package Dependecy"

cd $APPCENTER_SOURCE_DIRECTORY
cmd='find ./ -iname project.pbxproj'
packageName=$(eval "$cmd")
cat $packageName
sed -i '' "s^//^//$Username:$Password@^" $packageName
cat $packageName