# Publisher name ({0}) does not match signing certificate subject: {1}. Updating Publisher name.

# Discussion

If you find the following text in your build log ` ##[warning]C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Microsoft\VisualStudio\v16.0\AppxPackage\Microsoft.AppXPackage.Targets(xxxx,x): Warning : Publisher name {0} does not match signing certificate subject: {1}. Updating Publisher name.`

This warning indicates the a mismatch in the signing certificate subject name and the Package.appxmanifest Identity element publisher name. 
* If publishing to the Store your app may be rejected for using an incorrect name.
* May cause failures to run on local machine of user if an incorrect certificate was used for signing.

Possible Reasons for this failure
1. The Package.appxmanifest Identity element publisher name is incorrect
    * [the "Subject" in the certificate must match the "Publisher" section in your app's manifest](https://docs.microsoft.com/en-us/windows/msix/package/create-certificate-package-signing#determine-the-subject-of-your-packaged-app)
2. An incorrect App Center Signing Certificate is being used to compare with the manifest 
* Verify signing certificate subject value is correct in the warning message: "the does not match signing certificate subject: {1}"

In either case, you must correct the name mismatch and build again. If you change the certificate remember to save the build configuration in App Center portal.

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)