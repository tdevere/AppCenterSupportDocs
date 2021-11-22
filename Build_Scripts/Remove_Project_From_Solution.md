# Remove Project From Solution
## Recommended to use in appcenter-post-clone.sh

Why remove a project from your solution before build?
* You are trying to avoid a build issue with that project
* You want improved build performance by excluding projects which do not need to be rebuilt

This script requires the use of a [custom build variable](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/) to be configured. The values of these do not matter but you may make them boolean: true/false to make them more understandable. 

* RemoveUWPProjects
* RemoveANDROIDProjects
* RemoveIOSProjects

In your App Center build configuration, add the build environment variables to enable removing each project types from the .SLN for that build.

Another consideration is to ensure that the search term will match your specific project name. In the same below, it's assumed that UWP, iOS, and Android will be in the name of each project file. 


    #!/usr/bin/env bash

    echo "The Post Clone Script"

    SLN_PATH=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*.sln' -type f -print0)
    echo "SLN_PATH = $SLN_PATH"

    if [ -z "$RemoveUWPProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
        exit
    fi

    UWP_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*UWP*.csproj' -type f -print0 )
    echo " UWP_PATHS = $UWP_PATHS"

    for p in "$UWP_PATHS"; do
        echo "Removing $p from $SLN_PATH" || true
        dotnet sln $SLN_PATH remove $p || true
    done

    if [ -z "$RemoveANDROIDProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
        exit
    fi

    ANDROID_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*Android*.csproj' -type f -print0 )
    echo "ANDROID_PATHS = $ANDROID_PATHS"

    for p in "$ANDROID_PATHS"; do
        echo "Removing $p from $SLN_PATH" || true
        dotnet sln $SLN_PATH remove $p || true
    done

    if [ -z "$RemoveIOSProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
        exit
    fi

    IOS_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -name '*IOS*.csproj' -type f -print0 )
    echo "IOS_PATHS = $IOS_PATHS"

    for p in "$IOS_PATHS"; do
        echo "Removing $p from $SLN_PATH" || true
        dotnet sln $SLN_PATH remove $p || true
    done


## PowerShell Example
In this example, a new consideration should be made. In the case of a shared project reference which should be built, you'll need to update the -Exclude option to avoid missing targets you actually require. In the sample below, that shared project is named "NU1503_Mobile_Project.csproj"

    $SLN_PATH = Get-ChildItem -Path $env:APPCENTER_SOURCE_DIRECTORY -Include *.sln 
    $AllProjects = Get-ChildItem -Path $env:APPCENTER_SOURCE_DIRECTORY -Include *.csproj -Exclude "*UWP*.csproj", "NU1503_Mobile_Project.csproj" -Recurse
    write-host $SLN_PATH
    write-host $AllProjects
    foreach ($project in $AllProjects)
    {
        write-host "Removing $project from $SLN_PATH"
        dotnet sln $SLN_PATH remove $project
    }