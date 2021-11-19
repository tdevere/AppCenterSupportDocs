# Execute Test On Real Device Using A Custom Build Script

You'll need to know your APK file path and AppCenter Org/AppName and replace those for this script. You also need to add a build environment variable named AppCenterTokenForTest, which contains a valid App Center API Token


    #!/usr/bin/env bash

    echo "The Post Build Script START"

    if [ -z "$AppCenterTokenForTest" ]
    then 
        echo "This script only runs within the context of App Center builds"
        exit
    fi

    appcenter login --token $AppCenterTokenForTest

    appcenter test generate uitest --platform android --output-path /Users/runner/work/1/a/GeneratedTest

    nuget restore -NonInteractive /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln

    xbuild /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln /p:Configuration=Release

    appcenter test prepare uitest --artifacts-dir /Users/runner/work/1/a/Artifacts --app-path /Users/runner/work/1/a/build/com.ManualTestOnDevice.ReleaseTest1.apk --build-dir /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/bin/Release --debug --quiet

    appcenter test run manifest --manifest-path /Users/runner/work/1/a/Artifacts/manifest.json --app-path /Users/runner/work/1/a/build/com.ManualTestOnDevice.yourapp.apk --app AppCenterSupportDocs/ManualTestOnDevice --devices any_top_1_device --test-series launch-tests --locale en_US -p msft/test-run-origin=Build/Launch --debug --quiet --token $AppCenterTokenForTest

    echo "The Post Build Script END"