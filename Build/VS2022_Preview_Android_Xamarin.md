# error XA0000: Could not determine API level for $(TargetFrameworkVersion) of 'v12.0'. 

## Discussion
* App Center Build Agents do not currently support compling Android v12.0 (as of 11/2/2021)
* The default JAVA_HOME value set on the App Center build agents points to Java SDK version 1.8.0 (as of 11/2/2021)

## Primary Error

### error XA0000: Could not determine API level for $(TargetFrameworkVersion) of 'v12.0'.

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

### Downgrade to Android 11.0
![](/Images/Android_Xamarin_TargetFramework.png "Sample Project Settings")
### Add a custom environment variable in the App Center build configuration, then save and build the application again.
![](/Images/AppCenterBuildVariable_JAVA_HOME.png "AppCenter Build Enviornment Settings")

## Expected Result

After the downgrade of the project and configuring JAVA_HOME to point to the newer Java SDK the build output should look like this:

    Build started 11/2/2021 5:16:14 PM.
    Project "/Users/runner/work/1/s/VS22PreviewOutOfTheBoxAndroidXamarin/VS22PreviewOutOfTheBoxAndroidXamarin.csproj" on node 1 (PackageForAndroid target(s)).
    _CreateStampDirectory:
    Creating directory "obj/Debug/stamp/".
    _ResolveAndroidTooling:
    Found Java SDK version 11.0.13.
    Found Java SDK version 11.0.13.
    _ResolveXamarinAndroidTools:
    Found Xamarin.Android 11.3.0.4






