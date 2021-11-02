# Error: Failed to publish to store.

## Discussion

If your App Center build log contains the following error details:

* ` ##[error]{"code":"store_release_forbidden","message":"Error: Failed to publish to store. Release with version code (int) can not be published since a release with a higher version (int+) already exists in "". Downgrading the app version is not supported for Google Play."} `

* ` ##[error]You are attempting to distribute an Application that has a lower versionCode than what is currently in the Google Playstore.`

You are likely attempting to distribute an Application that has a lower versionCode than what is currently in the Google Playstore.

## Solutions

* When distributing to the Google Playstore, you may encounter this error if the versionCode value is lower than was is currently on the Playstore.
* If App Center has the auto increment build option configured, during the build step named 'Set version code', we will configure the versionCode value to either Build ID or Timestamp.
* In anycase, you will need to use a value which meets the expectation of Google Playstore 

* Some customers have used this [Pre-Build Script](https://github.com/microsoft/appcenter/blob/master/sample-build-scripts/react-native/version-name/appcenter-pre-build.sh) to override versionCode in the AndroidManisfest.xml or PList file.  

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)