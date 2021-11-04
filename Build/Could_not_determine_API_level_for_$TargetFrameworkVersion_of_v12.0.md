# error XA0000: Could not determine API level for $(TargetFrameworkVersion) of 'vXX.X'. 

## Discussion
This error happens on the MSBuild step _ResolveAndroidTooling within the call [ValidateApiLevels](https://github.com/xamarin/xamarin-android/blob/617500c92d989c87641db7010595f296eeffcfde/src/Xamarin.Android.Build.Tasks/Tasks/Legacy/ResolveAndroidTooling.cs#L64).

    Priority: $(UseLatestAndroidPlatformSdk) > $(AndroidApiLevel) > $(TargetFrameworkVersion)

    If $(TargetFrameworkVersion) isn't set, and $(AndroidApiLevel) isn't set, act as if $(UseLatestAndroidPlatformSdk) is True

    If $(UseLatestAndroidPlatformSdk) is true, we do as it says: use the latest installed version.

    Otherwise, if $(AndroidApiLevel) is set, use it and set $(TargetFrameworkVersion).
    Rationale: monodroid/samples/xbuild.make uses $(AndroidApiLevel)

    Otherwise, if $(TargetFrameworkVersion) is set, use it and set $(AndroidApiLevel).

## Primary Error

### error XA0000: Could not determine API level for $(TargetFrameworkVersion) of 'vXX.X'.

    Build started 11/2/2021 4:20:03 PM.
    Project "/Users/runner/work/1/s/VS22PreviewOutOfTheBoxAndroidXamarin/VS22PreviewOutOfTheBoxAndroidXamarin.csproj" on node 1 (PackageForAndroid target(s)).
    _CreateStampDirectory:
    Creating directory "obj/Debug/stamp/".
    _ResolveAndroidTooling:
    Found Java SDK version 1.8.0.
    Found Java SDK version 1.8.0.
    /Library/Frameworks/Mono.framework/External/xbuild/Xamarin/Android/Xamarin.Android.Legacy.targets(250,5): error XA0000: Could not determine API level for $(TargetFrameworkVersion) of 'v12.0'. [/Users/runner/work/1/s/VS22PreviewOutOfTheBoxAndroidXamarin/VS22PreviewOutOfTheBoxAndroidXamarin.csproj]
    Done Building Project "/Users/runner/work/1/s/VS22PreviewOutOfTheBoxAndroidXamarin/VS22PreviewOutOfTheBoxAndroidXamarin.csproj" (PackageForAndroid target(s)) -- FAILED.

    Build FAILED.

## Proposed Workaround
Use explict settings within the project files when possible. To do this ensure the values for AndroidApiLevel and TargetFrameworkVersion are set correctly. 

### AndroidUseLatestPlatformSdk = true
Change the AndroidUseLatestPlatformSdk `.csproj` project setting to `true` to enable use the latest Android Platform

	<AndroidUseLatestPlatformSdk>true</AndroidUseLatestPlatformSdk>

### TargetFrameworkVersion
Ensure TargetFrameworkVersion is properly set in the `.csproj` do your desired target

    <TargetFrameworkVersion>v12.0</TargetFrameworkVersion>

If these values are set correctly, look for the statement ` Found Java SDK version ` and note the value. In the example above, the version is `1.8.0` which does not support v12.0. We can influence the Java SDK version by overriding the JAVA_HOME build environment varible.

### Explicitly Set JAVA_HOME Version
At the start of the build log we find a link to the build agent included software

    Environment: macos-11
    Version: 20211029.3
    Included Software: https://github.com/actions/virtual-environments/blob/macOS-11/20211029.3/images/macos/macos-11-Readme.md

This list will contain the versions included on the build agent. 
![](/Images/Build_Agent_Java_Versions_Sample.png "Example Table")  


Add a custom environment variable in the App Center build configuration, then save the build configuration.
![](/Images/AppCenterBuildVariable_JAVA_HOME.png "AppCenter Build Enviornment Settings")

### Expected Result

After following these steps the Java SDK version should be updated and we no longer fail to determine the proper TargetFrameworkVersion:

    Build started 11/2/2021 5:16:14 PM.
    Project "/Users/runner/work/1/s/VS22PreviewOutOfTheBoxAndroidXamarin/VS22PreviewOutOfTheBoxAndroidXamarin.csproj" on node 1 (PackageForAndroid target(s)).
    _CreateStampDirectory:
    Creating directory "obj/Debug/stamp/".
    _ResolveAndroidTooling:
    Found Java SDK version 11.0.13.
    Found Java SDK version 11.0.13.
    _ResolveXamarinAndroidTools:
    Found Xamarin.Android 11.3.0.4

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)






