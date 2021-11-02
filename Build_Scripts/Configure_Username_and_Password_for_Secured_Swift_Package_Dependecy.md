# Configure Username and Password for Secured Swift Package Dependecy
## Recommended to use in appcenter-post-clone.sh



    #!/usr/bin/env bash

    echo "The Post Clone Script"

    if [ -z "$IsInAppCenter" ]
    then 
        echo "This script only runs within the context of App Center builds"
        exit
    fi

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