# Not found PathtoPublish

## Disscussion

### Issue 1
If your build log contains this text `##[error]Publishing build artifacts failed with an error: Not found PathtoPublish: d:\a\1\a\Symbols`

This may indicate the symbols directory is missing. We need to add a step in post-clone to create that directory. Then during build process, the symbols will be available later for the Publish Step

### Issue 1 Solution
1. Add the appcenter-post-clone.ps1 script next to your solution/project file to create an empty Scripts folder with the following content:
    * mkdir $env:BUILD_ARTIFACTSTAGINGDIRECTORY\Symbols

2. Push to repo, open App Center branch configuration and validate Post-clone script appears in More options within Build configuration.
3. Save & Build your branch configuration.

### Issue 2

If your build log contains this text `##[error]Publishing build artifacts failed with an error: Not found PathtoPublish  Some/path/here/1/a/build`

This may indicate the For React Native on Android, universal APK generation is disabled by default. If your app configuration is set up to build multiple APKs, e.g. different ones per CPU architecture or screen configuration, you need to make sure a universal APK is built as well. App Center's build system works with one main APK file and will ignore all APKs specific to a certain CPU/ABI or screen density

### Issue 2 Solution
1. This can be solved by generating a universal APK vs multiple APKs. Please see [Android developer guide](https://developer.android.com/studio/build/configure-apk-splits.html#configure-abi-split) 
    * Set UniversalApk to true for your React Native build configuration. 
2. Push to repo, open App Center branch configuration and configuration.
3. Save & Build your branch configuration.

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)