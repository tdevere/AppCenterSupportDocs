# java.util.zip.ZipException: invalid entry compressed size (expected XXXX but got XXXX bytes)

## Discussion
If you find these errors within the App Center build log:
* `java.util.zip.ZipException: invalid entry compressed size`
* `##[error]Error: /usr/bin/jarsigner failed with return code: 1`

## Solutions
If your gradle config has signing enabled and App Center's build configuration has enabled signing.
* Only sign app with one option either with AppCenter or declaring buildconfigs in Build.gradle file(app level)
     [see more](https://docs.microsoft.com/en-us/appcenter/build/android/code-signing)

In some instances with Xamarian projects templates created with Visual Studio, the project or solution files may need to be recreated.
* No root cause is known for this issue but we have observed that recreating one or both of these has resolve one case where there was no double signing issue at play.

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)