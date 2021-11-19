# error MSB4057: The target "_IsProjectRestoreSupported" does not exist in the project.

## Disscussion

Recently a change was introduced with an upgrade of Mono to 6.12.0.140. The default behavior of the "nuget restore" command has been changed in new Mono version (6.12.0.140) which impacts App Center builds. 

To check if you're hitting this problem, examine the build log for the following failure in the Restore Nuget build step:

* error MSB4057: The target "_IsProjectRestoreSupported" does not exist in the project.
* warning MSB4181: The "MSBuild" task returned false but did not log an error. 
* warning : Skipping restore for project '/Users/runner/work/1/s/*.UWP.csproj'. The project file may be invalid or missing targets required for restore.

This specifically impacts UWP projects within the Solution.

## Workaround

The best workaround available at this moment is to create an appcenter-post-clone.sh script and use dotnet to remove UWP project references. See [How to remove projects from your solution](/Build_Scripts/Remove_Project_From_Solution.md)

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




