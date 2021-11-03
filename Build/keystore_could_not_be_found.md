# Keystore could not be found

## Discussion

If the build log includes line(s) with the following details
* error XA4310: $(AndroidSigningKeyStore) file Some/Path/Here/.keystore` could not be found       

This may indicate the specified $(AndroidSigningKeyStore) file is set to a file that does not exist.

## Solution
* Check that the $(AndroidSigningKeyStore) MSBuild property is set to a validpath of an existing keystore. This property corresponds to the **Keystore** field in the **Android PackageSigning** section of the Visual Studio project property pages. 
* Push changes to repo. 
* In your build configurations via App Center portal Click Save and Build.      

# Still Require Help?
---
## Contact App Center Support
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/Build/Contact_App_Center_Suport_Build_Issue.md)